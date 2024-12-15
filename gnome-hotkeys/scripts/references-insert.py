#!/usr/bin/env python

import sys
import os
from datetime import datetime
import subprocess
from glob import glob
import time

REFS_PATH = os.path.expanduser('~/refs')
ARCHIVE_PATH = f'{REFS_PATH}/archive'
DATE_PATH = f'{REFS_PATH}/date'
IDX_PATH = f'{REFS_PATH}/idx'
IMPORT_PATH = f'{REFS_PATH}/import'

LOG_PATH = f'{REFS_PATH}/debug.log'

assert os.path.isdir(REFS_PATH)
assert os.path.isdir(ARCHIVE_PATH)
assert os.path.isdir(DATE_PATH)
assert os.path.isdir(IDX_PATH)
assert os.path.isdir(IMPORT_PATH)

def write_log(s,display=False):
    now = datetime.now()
    timestamp = f'[%10.6f]' % now.timestamp()
    msg = f'{timestamp} {s}'
    if display:
        print(s)
    with open(LOG_PATH,'a') as f:
        f.write(msg + '\n')

def get_hash(path):
    path = os.path.expanduser(path)
    return subprocess.check_output(['sha256sum', path]).split()[0].decode()

def get_glob(s):
    return sorted(glob(s))

def idx_to_path(idx):
    idx_str = '%06d' % idx
    return f'{IDX_PATH}/{idx_str[0:4]}/{idx_str[4:6]}'

def path_to_idx(path):
    root,_ = os.path.splitext(path)
    int_str = root.replace(IDX_PATH,'').replace('/','')
    return int(int_str)

def get_idx_last():
    a = get_glob(f'{IDX_PATH}/*')
    if len(a) == 0:
        return 0
    b = get_glob(f'{a[-1]}/*')
    if len(b) == 0:
        return path_to_idx(f'{a[-1]}/00')
    return path_to_idx(f'{a[-1]}/{b[-1]}')

class Reference:
    def __init__(self, src, dt, num, idx_last):
        # general
        self.src = src
        self.ext = os.path.splitext(src)[1]
        self.hash = get_hash(src)
        self.dt = dt
        self.num = num
        assert num >= 1
        assert num <= 99
        self.idx = idx_last + num

        # archive
        self.hash_keys = [self.hash[2*i:2*(i+1)] for i in range(4)]

        self.hash_dir = f'{ARCHIVE_PATH}/{"/".join(self.hash_keys)}'
        self.hash_filename_root = self.hash
        self.hash_filename = f'{self.hash_filename_root}{self.ext}'
        self.hash_filepath = f'{self.hash_dir}/{self.hash_filename}'
        
        self.dst = self.hash_filepath
        
        # date
        self.year, self.month, self.day, self.hour, self.minute, self.second = dt.strftime(r'%Y-%m-%d-%H-%M-%S').split('-')

        self.date_dir = f'{DATE_PATH}/{self.year}/{self.month}-{self.day}/{self.hour}-{self.minute}-{self.second}'
        self.date_filename_root = '%02d' % self.num
        self.date_filename = f'{self.date_filename_root}{self.ext}'
        self.date_filepath = f'{self.date_dir}/{self.date_filename}'

        self.date_relpath = os.path.relpath(self.dst, self.date_dir)

        # idx
        self.idx_filepath = f'{idx_to_path(self.idx)}{self.ext}'
        self.idx_dir = os.path.dirname(self.idx_filepath)

        self.idx_relpath = os.path.relpath(self.dst, self.idx_dir)

    def has_collision(self):
        return os.path.exists(self.dst)
    
    def make_hash_folders(self):
        a = self.hash_dir
        write_log(f'mkdir -p {a}')
        os.makedirs(a, exist_ok=True)

    def make_date_folders(self):
        a = self.date_dir
        write_log(f'mkdir -p {a}')
        os.makedirs(a, exist_ok=True)

    def make_idx_folders(self):
        a = self.idx_dir
        write_log(f'mkdir -p {a}')
        os.makedirs(a, exist_ok=True)
    
    def move(self):
        write_log(f'mv {self.src} {self.dst}')
        assert not os.path.exists(self.dst)
        os.rename(self.src, self.dst)

    def make_date(self):
        a = self.date_relpath
        b = self.date_filepath
        write_log(f'ln -s {a} {b}')
        os.symlink(a,b)

    def make_idx(self):
        a = self.idx_relpath
        b = self.idx_filepath
        write_log(f'ln -s {a} {b}')
        os.symlink(a,b)
    
    def run(self):
        self.make_hash_folders()
        self.move()
        self.make_date_folders()
        self.make_date()
        self.make_idx_folders()
        self.make_idx()

def main():
    write_log('start')

    now = datetime.now()
    filepaths = sorted(glob(f'{IMPORT_PATH}/*'))
    idx_last = get_idx_last()

    write_log(f'filepaths: {filepaths}')
    write_log(f'idx_last: {idx_last}')

    if len(filepaths) == 0:
        write_log(f'No files found in {IMPORT_PATH}',display=True)
        sys.exit(0)

    refs = [Reference(f,now,i+1,idx_last) for i,f in enumerate(filepaths)]

    any_collisions = False
    for ref in refs:
        if ref.has_collision():
            write_log(f'Collision: {ref.src} -> {ref.dst}',display=True)
            any_collisions = True
    if any_collisions:
        write_log('Exiting due to collisions')
        sys.exit(1)

    for ref in refs:
        ref.run()
        write_log(f'file://{ref.idx_filepath}',display=True)

if __name__ == '__main__':
    main()

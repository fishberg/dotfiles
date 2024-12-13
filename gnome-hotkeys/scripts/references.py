#!/usr/bin/env python

import os
import re
from datetime import datetime

REFERENCE_PATH = os.path.expanduser('~/storage/references')
assert os.path.isdir(REFERENCE_PATH)

for P,D,F in os.walk(REFERENCE_PATH):
    break

assert D == []

def is_valid(f):
    base = os.path.splitext(f)[0]
    res = re.match(r'\d{4}-\d{2}-\d{2}_\d{2}-\d{2}-\d{2}_\d{2}', base) is not None
    return res

F = [f for f in F if not is_valid(f)]

T = datetime.now().strftime(r'%Y-%m-%d_%H-%M-%S')+ '_%02d'
print(T)

RENAMES = []
for i,f in enumerate(F):
    src = os.path.join(REFERENCE_PATH, f)
    base,ext = os.path.splitext(f)
    filename = (T % i) + ext
    dst = os.path.join(REFERENCE_PATH, filename)
    RENAMES.append((src,dst))

for src,dst in RENAMES:
    print(f'{src} -> {dst}')
    assert not os.path.exists(dst)
    os.rename(src,dst)
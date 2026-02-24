#!/usr/bin/env python

import subprocess
import shlex
import re
import sys

url = subprocess.check_output(['git', 'remote', 'get-url', 'origin']).decode('utf-8')

SUPPORTED = ['github.com', 'gitlab.com']
assert any(base in url for base in SUPPORTED)

# `git@github.com:fishberg/dotfiles.git`
if re.search(r'^git@',url):
    res = url
    res = re.sub(r':','/',res)            # replace ":" with "/"
    res = re.sub(r'^git@','https://',res) # replace "git@" with "http://"
    #res = re.sub('(?<!https):','/',res)   # replace every ":" not preceded by "https" with "/"
    res = re.sub(r'\.git$','',res)        # replace ".git" with ""
    print(res)
    #open_firefox(res)
    sys.exit(0)

# `https://github.com/fishberg/dotfiles.git`
if re.search(r'^https://',url):
    res = url
    res = re.sub(r'\.git$','',res)        # replace ".git" with ""
    print(res)
    #open_firefox(res)
    sys.exit(0)

sys.exit(1)

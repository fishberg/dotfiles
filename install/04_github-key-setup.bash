#!/usr/bin/env bash

cd ~/.ssh
ssh-keygen

firefox --new-window https://github.com/settings/keys

# normally aliased as open
nohup nautilus -w . >/dev/null 2>&1

#!/usr/bin/env bash

cd ~/.ssh
ssh-keygen -f $HOSTNAME
ln -s $HOSTNAME id_rsa
ln -s $HOSTNAME.pub id_rsa.pub

# open GitHub so you can add your new key?
#firefox --private-window https://github.com/settings/keys

# normally aliased as open
#nohup nautilus -w . >/dev/null 2>&1

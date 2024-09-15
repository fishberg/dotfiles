#!/usr/bin/env bash

# show commands
set -x

mkdir -p ~/.ssh
cd ~/.ssh
ssh-keygen -f $HOSTNAME
ln -s $HOSTNAME id_rsa
ln -s $HOSTNAME.pub id_rsa.pub
ln -s $HOSTNAME id_ed25519
ln -s $HOSTNAME.pub id_ed25519.pub

cat $HOSTNAME.pub
echo 'add key here: https://github.com/settings/keys'

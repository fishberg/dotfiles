#!/usr/bin/env zsh

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

HOSTNAME=$(hostname -s)

mkdir -p ~/.ssh
cd ~/.ssh
ssh-keygen -f $HOSTNAME
ln -s $HOSTNAME id_rsa
ln -s $HOSTNAME.pub id_rsa.pub
ln -s $HOSTNAME id_ed25519
ln -s $HOSTNAME.pub id_ed25519.pub

cat $HOSTNAME.pub
echo 'add key here: https://github.com/settings/keys'

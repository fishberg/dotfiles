#!/usr/bin/env bash

# show commands
set -x

# dependency
sudo apt install python3-gpg

# get .deb file
echo 'get .deb file: https://www.dropbox.com/install-linux'
# TODO add prompt

# install with apt
echo 'sudo apt install ~/Download/dropbox_*.deb'
# TODO add prompt

# close all nautilus for installation
nautilus --quit

# start daemon
dropbox start

# check status
dropbox status

# exclude syncing archive
cd ~/Dropbox/archive
dropbox exclude add *

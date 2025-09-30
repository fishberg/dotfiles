#!/usr/bin/env bash

# show commands
set -x

sudo apt install openssh-server

# configure server: /etc/ssh/sshd_config
# configure client: /etc/ssh/ssh_config

#PasswordAuthentication yes
#PasswordAuthentication no

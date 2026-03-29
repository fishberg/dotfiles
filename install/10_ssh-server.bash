#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

sudo apt install -y openssh-server

# configure server: /etc/ssh/sshd_config
# configure client: /etc/ssh/ssh_config

#PasswordAuthentication yes
#PasswordAuthentication no

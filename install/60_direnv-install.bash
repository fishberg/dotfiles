#!/usr/bin/env zsh

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# install
sudo apt install -y direnv

# add to .bashrc
echo '
# installed direnv
eval "$(direnv hook zsh)"' >> ~/.bashrc

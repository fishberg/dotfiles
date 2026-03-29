#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# link config file
ln -s $DOTFILES_ROOT/tmux/_tmux.conf ~/.tmux.conf

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

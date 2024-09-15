#!/usr/bin/env bash

# show commands
set -x

# assumes ~/.dotfiles
echo '
# installed helper files
export DOTFILES_ROOT="$HOME/.dotfiles"
source $DOTFILES_ROOT/bash/smart-source.bash' >> ~/.bashrc

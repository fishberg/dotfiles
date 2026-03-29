#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# assumes ~/.dotfiles
echo '
# installed helper files
export DOTFILES_ROOT="$HOME/.dotfiles"
source $DOTFILES_ROOT/bash/smart-source.bash' >> ~/.bashrc

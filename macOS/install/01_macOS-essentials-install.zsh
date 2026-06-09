#!/usr/bin/env zsh

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# minimum functionality
brew install git neovim tmux

# utilities 
brew install htop fastfetch progress magic-wormhole rclone ffmpeg ccrypt tree tmuxp

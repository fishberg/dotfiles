#!/usr/bin/env zsh

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# install
brew install direnv

# add to .zshrc
echo '
# installed direnv
eval "$(direnv hook zsh)"' >> ~/.zshrc

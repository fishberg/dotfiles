#!/usr/bin/env zsh

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# install
brew install pyenv

# add to .zshrc
echo '
# installed pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"' >> ~/.zshrc

# install set default global python version
pyenv install 3.12
pyenv global 3.12

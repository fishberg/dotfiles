#!/bin/bash

# show commands
set -x

# install VimPlug
## https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# symlink init.vim
mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# run :PlugInstall
## How to run PlugInstall directly from command line
## https://github.com/junegunn/vim-plug/issues/675
nvim +'PlugInstall --sync' +qa

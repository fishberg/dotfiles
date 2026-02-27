#!/usr/bin/env bash

# show commands
set -x

# symlink nvim config folder
# -T prevents nesting in nesting if symlink already exists
ln -svT $DOTFILES_ROOT/nvim ~/.config/nvim

# install VimPlug
## https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# run :PlugInstall
## How to run PlugInstall directly from command line
## https://github.com/junegunn/vim-plug/issues/675
nvim +'PlugInstall --sync' +qa

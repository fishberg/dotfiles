#!/usr/bin/env bash

# show commands
set -x

# You can reset gsettings field with:
# gsettings reset org.freedesktop.ibus.panel.emoji hotkey

# $ gsettings set org.gnome.desktop.wm.keybindings close  "['<Alt>F4']"
gsettings set org.gnome.desktop.wm.keybindings close  "['<Alt>F4', '<Shift><Super>q']"

# Settings > Keyboard View and Customize Shortcuts > "View split on {left,right}"
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>Left']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>Right']"

# $ gsettings list-recursively | grep '<Super>o'
# org.gnome.settings-daemon.plugins.media-keys rotate-video-lock-static ['<Super>o', 'XF86RotationLockToggle']
gsettings set org.gnome.settings-daemon.plugins.media-keys rotate-video-lock-static "[]"
# requires reboot to take effect

# $ gsettings list-recursively | grep "<Super>semicolon"
# org.freedesktop.ibus.panel.emoji hotkey ['<Super>period', '<Super>semicolon']
gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"

echo 'some default hotkeys require a roboot to be unset'

# ----------------------------------------------------------
# install public hotkeys
# ----------------------------------------------------------

#cd $DOTFILES_ROOT/gnome-hotkeys/
#./run-notebook-as-py.bash configs/general-hotkeys.csv

# ----------------------------------------------------------
# install private hotkeys
# ----------------------------------------------------------

# install ~/.dotfiles-private
# https://github.com/fishberg/dotfiles-private
git clone git@github.com:fishberg/dotfiles-private.git ~/.dotfiles-private
~/.dotfiles-private/ln_all.bash

# run script (don't overwrite)
cd $DOTFILES_ROOT/gnome-hotkeys/
./run-notebook-as-py.bash configs/my-hotkeys.csv

# run script (overwrite)
#cd $DOTFILES_ROOT/gnome-hotkeys/
#./run-notebook-as-py.bash configs/my-hotkeys.csv --overwrite

#!/usr/bin/env bash

# $ gsettings list-recursively | grep '<Super>Left'

# set snap left/right
# gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>Left']"
# gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>Right']"



# default "['<Super>s']"
gsettings set org.gnome.shell.keybindings toggle-quick-settings "[]"

# gsettings list-recursively | grep '<Super>semicolon'
# org.freedesktop.ibus.panel.emoji hotkey ['<Super>period', '<Super>semicolon']
# default "['<Super>period', '<Super>semicolon']"
gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"


# $ gsettings list-recursively | grep '<Super>o'
# org.gnome.settings-daemon.plugins.media-keys rotate-video-lock-static ['<Super>o', 'XF86RotationLockToggle']
gsettings set org.gnome.settings-daemon.plugins.media-keys rotate-video-lock-static "['XF86RotationLockToggle']"

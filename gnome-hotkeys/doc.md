# fix

## enable snap left/right w/ Super+arrow
```
$ gsettings list-recursively | grep '<Super>Left'
org.gnome.mutter.keybindings toggle-tiled-left ['<Super>Left']
org.gnome.shell.extensions.tiling-assistant tile-left-half ['<Super>Left', '<Super>KP_4']

$ gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>Left']"
$ gsettings reset org.gnome.mutter.keybindings toggle-tiled-left
$ gsettings get org.gnome.mutter.keybindings toggle-tiled-left
['<Super>Left']

$ gsettings list-recursively | grep '<Super>Right'
org.gnome.mutter.keybindings toggle-tiled-right ['<Super>Right']
org.gnome.shell.extensions.tiling-assistant tile-right-half ['<Super>Right', '<Super>KP_6']

$ gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>Right']"
```

## unbind Super+s
```
$ gsettings list-recursively | grep '<Super>s'
org.gnome.shell.keybindings toggle-quick-settings toggle-quick-settings ['<Super>s']

$ gsettings get org.gnome.shell.keybindings toggle-quick-settings
['<Super>s']

$ gsettings set org.gnome.shell.keybindings toggle-quick-settings "[]"
```

## unbind Super+;
```
$ gsettings list-recursively | grep '<Super>semicolon'
org.freedesktop.ibus.panel.emoji hotkey ['<Super>period', '<Super>semicolon']

$ gsettings get org.freedesktop.ibus.panel.emoji hotkey
['<Super>period', '<Super>semicolon']

$ gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"
```

## unbind Super+o
```
$ gsettings list-recursively | grep '<Super>o'
org.gnome.settings-daemon.plugins.media-keys rotate-video-lock-static ['<Super>o', 'XF86RotationLockToggle']

$ gsettings get org.freedesktop.ibus.panel.emoji hotkey
['<Super>o', 'XF86RotationLockToggle']

$ gsettings set org.freedesktop.ibus.panel.emoji hotkey "['XF86RotationLockToggle']"
```

# gsettings
```
gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom11/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom12/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom13/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom14/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom15/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom16/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom17/']"
```

# dconf
```
dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ > backup.log

dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ < backup.log
```

backup.log:
```
[custom0]
binding='<Super>Return'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/terminal.bash'
name='Terminal'

[custom1]
binding='<Super>f'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/firefox.bash'
name='Firefox'

[custom10]
binding='<Super>o'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/overleaf.bash'
name='Overleaf'

[custom11]
binding='<Super>u'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/open-arxiv-ro.bash'
name='arXiv'

[custom12]
binding='<Super>bracketleft'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/google-scholar.bash'
name='Google Scholar'

[custom13]
binding='<Super>bracketright'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/semantic-scholar.bash'
name='Semantic Scholar'

[custom14]
binding='<Super>backslash'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/connected-papers.bash'
name='Connected Papers'

[custom15]
binding='<Shift><Super>d'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/date-to-clipboard.bash'
name='Date to Clipboard'

[custom16]
binding='<Super>period'
command='/home/fishberg/.dotfiles/gnome-hotkeys/private-scripts/zoom-url.bash'
name='Zoom URL'

[custom17]
binding='<Shift><Super>l'
command='/home/fishberg/.dotfiles/gnome-hotkeys/private-scripts/url-strip.bash'
name='URL Strip'

[custom2]
binding='<Super>c'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/calculator.bash'
name='Calculator'

[custom3]
binding='<Super>e'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/nautilus.bash'
name='Nautilus'

[custom4]
binding='<Super>d'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/downloads.bash'
name='Downloads'

[custom5]
binding='<Super>r'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/read.bash'
name='Read'

[custom6]
binding='<Super>s'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/storage.bash'
name='Storage'

[custom7]
binding='<Super>semicolon'
command='/home/fishberg/.dotfiles/gnome-hotkeys/private-scripts/weiss.bash'
name='Weiss'

[custom8]
binding='<Super><Shift>semicolon'
command='/home/fishberg/.dotfiles/gnome-hotkeys/private-scripts/noir.bash'
name='Noir'

[custom9]
binding='<Super>g'
command='/home/fishberg/.dotfiles/gnome-hotkeys/scripts/github.bash'
name='GitHub'
```

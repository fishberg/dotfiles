# https://wiki.archlinux.org/title/Tmux#Theming
print256colors() {
    for i in {0..255}; do printf "\x1b[38;5;${i}mcolor${i} - ██████████\n"; done
}

# https://wiki.archlinux.org/title/Tmux#Theming
print256colors() {
    for i in {0..255}; do printf "\x1b[38;5;${i}mcolor${i} - ██████████\n"; done
}

text_send () {
    local host="$1"
    local file="$2"
    shift 2

    printf '%s\n' "$*" | ssh "$host" "cat >> '$file'"
}

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

open() {
    # if you ran with 0 args, set $1 to "."
    if [[ $# -eq 0 ]]; then
        set -- .
    fi

    for target in "$@"; do
        if [[ "$target" =~ ^https?:// ]]; then
            xdg-open "$target" >/dev/null 2>&1 &
        elif [[ -e "$target" ]]; then
            xdg-open "$target" >/dev/null 2>&1 &
        else
            echo "open: '$target' does not exist" >&2
        fi
    done
}

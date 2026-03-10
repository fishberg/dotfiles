venv_create() {
    NAME="${1:-venv}"
    set -x
    python -m venv $NAME
    set +x
}

venv_activate() {
    #source */bin/activate
    shopt -s nullglob
    local matches=(*/bin/activate)

    if (( ${#matches[@]} == 1 )); then
        source "${matches[0]}"
    elif (( ${#matches[@]} == 0 )); then
        echo "No */bin/activate scripts found."
        return 1
    else
        echo "Multiple activate scripts found:"
        printf '  %s\n' "${matches[@]}"
        return 1
    fi
}

venv_deactivate() {
    deactivate
}

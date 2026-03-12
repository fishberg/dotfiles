venv_create() {
    local NAME="${1:-.venv}"
    #set -x
    python -m venv $NAME
    venv_activate
    #set +x
}

venv_activate() {
    # nullglob = if nothing matches, return ""
    # dotglob = include files/dirs with leading . in *
    local matches
    matches=($(shopt -s nullglob dotglob; echo */bin/activate))

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

venv_requirements() {
    local NAME="${1:-requirements.txt}"
    venv_create
    venv_activate
    pip install -r $NAME
}

#!/bin/bash

# curl -sLf https://raw.githubusercontent.com/fishberg/dotfiles/master/install/install-fresh.sh | bash

check_installed () {
    command="which $1"
    response="$($command)"

    # -n string is not empty, -z string is empty
    if [ -z $response ]; then
        echo "ERROR: $1 is not installed"
        exit
    fi
}

# check programs are installed
check_installed curl
check_installed git

# setup github keys
curl -sLf https://raw.githubusercontent.com/fishberg/dotfiles/master/install/config-github-keys.sh | bash

# clone with ssh
git clone git@github.com:fishberg/dotfiles.git ~/.dotfiles

# install helpers
cd ~/.dotfiles/install
./install-helper.sh

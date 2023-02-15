#!/usr/bin/env bash

# wget -q -O - https://raw.githubusercontent.com/fishberg/dotfiles/master/install/quick-start.bash | bash -s
# curl https://raw.githubusercontent.com/fishberg/dotfiles/master/install/quick-start.bash | bash -s

# check programs are installed
if which git > /dev/null; then
    echo "git is installed"
else
    echo "git is NOT installed"
    sudo apt install git
fi

# https clone
RAW_CONTENT_URL=https://raw.githubusercontent.com/fishberg/dotfiles/master
wget -q -O - $RAW_CONTENT_URL/install/dotfiles-repo/clone-https.bash | bash -s

# run installers
# TODO when run from wget/curl, this will run but autoskip each script
bash ~/.dotfiles/install/run-installers.bash

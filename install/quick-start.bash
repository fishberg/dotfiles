#!/usr/bin/env bash

# wget -q -O - https://raw.githubusercontent.com/fishberg/dotfiles/master/install/quick-start.bash | bash -s

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

# run install scripts
cd ~/.dotfiles/install

scripts=$(find . -maxdepth 1 -type f | sort | grep -E "\.\/[[:digit:]][[:digit:]]_.*\.bash")

for script in $scripts; do
    echo
    read -p "RUN INSTALL SCRIPT $script? (y/n) " yn
    case $yn in 
        y ) echo "running $script"; $script ; echo "complete";;
        * ) echo "skipping $script"
    esac
done

#!/usr/bin/env bash

# wget -O - https://raw.githubusercontent.com/fishberg/dotfiles/master/install/quick-start.bash | bash

# check programs are installed
if which git > /dev/null; then
    echo "git is installed"
else
    echo "git is NOT installed"
    sudo apt install git
fi

# https clone
raw_content_url=https://raw.githubusercontent.com/fishberg/dotfiles/master
wget -O - $(raw_content_url)/install/dotfiles-repo/clone-https.bash | bash

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

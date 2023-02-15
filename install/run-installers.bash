#!/usr/bin/env bash

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

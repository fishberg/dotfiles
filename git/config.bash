#!/usr/bin/env bash

git config --global user.name "Andrew Fishberg"
git config --global user.email "fishberg.dev@gmail.com"

# https://stackoverflow.com/questions/13846300/how-to-make-git-pull-use-rebase-by-default-for-all-my-repositories
git config --global pull.rebase true

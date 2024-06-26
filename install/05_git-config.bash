#!/usr/bin/env bash

# commit user info
git config --global user.name "Andrew Fishberg"
git config --global user.email "fishberg.dev@gmail.com"

# use vim
git config --global core.editor nvim

# set default branch
git config --global init.defaultBranch main

# rebase instead of merge
git config --global pull.rebase true

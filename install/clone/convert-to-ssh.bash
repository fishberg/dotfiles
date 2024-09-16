#!/usr/bin/env bash

# https://www.howtogeek.com/devops/how-to-switch-a-github-repository-to-ssh-authentication/
git -C ~/.dotfiles remote rm origin
git -C ~/.dotfiles remote add origin git@github.com:fishberg/dotfiles

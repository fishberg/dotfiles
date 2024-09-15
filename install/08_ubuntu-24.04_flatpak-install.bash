#!/usr/bin/env bash

# show commands
set -x

# flatpak
# https://flatpak.org/setup/
# https://flatpak.org/setup/Ubuntu

# install
sudo apt install -y flatpak

# add flathub repos
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# for gnome integration
sudo apt install gnome-software-plugin-flatpak

# complete install
echo "reboot requried"

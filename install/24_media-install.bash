#!/usr/bin/env bash

# show commands
set -x

# media
sudo apt install vlc
sudo snap install gimp
sudo snap install kdenlive
sudo snap install inkscape

# OBS
# https://flathub.org/apps/com.obsproject.Studio
sudo flatpak install flathub com.obsproject.Studio
# flatpak run com.obsproject.Studio

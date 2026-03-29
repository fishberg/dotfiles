#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# media
sudo apt install -y vlc
sudo apt install -y audacity
sudo snap install gimp
sudo snap install kdenlive

# OBS
# https://flathub.org/apps/com.obsproject.Studio
sudo flatpak install flathub com.obsproject.Studio
# flatpak run com.obsproject.Studio

# inkscape
# https://flathub.org/apps/org.inkscape.Inkscape
flatpak install flathub org.inkscape.Inkscape
# flatpak run org.inkscape.Inkscape

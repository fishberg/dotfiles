#!/usr/bin/env bash

# show commands
set -x

# update
sudo apt -y update
sudo apt -y upgrade

# ubuntu drivers
sudo ubuntu-drivers autoinstall

# minimum functionality
sudo apt install -y git curl neovim tmux

# gnome
sudo apt install -y gnome-session gnome-tweaks arc-theme

# utilities
sudo apt install -y htop neofetch pm-utils net-tools xclip

# python3
sudo apt install -y python-is-python3 python3-pip
pip install numpy
pip install matplotlib
pip install pandas
pip install scipy
pip install jupyterlab
pip install nbstripout
pip install grip

# media
sudo apt install -y gimp ffmpeg

# purge
sudo apt purge -y update-manager update-notifier unattended-upgrades

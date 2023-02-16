#!/usr/bin/env bash

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
pip3 install numpy
pip3 install matplotlib
pip3 install pandas
pip3 install scipy
pip3 install jupyterlab
pip3 install nbstripout
pip3 install grip

# media
sudo apt install -y gimp ffmpeg

# purge
sudo apt purge -y update-manager update-notifier unattended-upgrades

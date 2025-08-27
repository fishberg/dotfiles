#!/usr/bin/env bash

# show commands
set -x

# update
sudo apt -y update
sudo apt -y upgrade

# ubuntu drivers
sudo ubuntu-drivers install

# minimum functionality
sudo apt install -y git curl neovim tmux

# utilities
sudo apt install -y htop neofetch pm-utils net-tools xclip progress magic-wormhole rsync rclone ffmpeg ccrypt tree plocate tmuxp

# purge
sudo apt purge -y update-manager update-notifier unattended-upgrades
sudo apt autoremove -y

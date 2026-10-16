#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# gnome
sudo apt install -y \
    gnome-session \
    gnome-tweaks \
    gnome-shell-extensions \
    gnome-shell-extension-manager

# ----------------------------------------------------------
# gnome clock
# ----------------------------------------------------------
# Settings > System > Date & Time > Time Format > 24-hour
# Settings > System > Date & Time > {Week Day, Date, Seconds} > On
#
# gnome-tweaks no longer has clock settings
# `gsettings list-recursively org.gnome.desktop.interface`
# - shows all settings you can edit
# Reference: https://askubuntu.com/a/1267523
#gsettings set org.gnome.desktop.interface clock-show-date true
#gsettings set org.gnome.desktop.interface clock-show-seconds true
#gsettings set org.gnome.desktop.interface clock-show-weekday true
#gsettings set org.gnome.desktop.interface clock-format '24h'

# ----------------------------------------------------------
# gnome settings
# ----------------------------------------------------------
# Settings > Appearance > Style > Dark
# Settings > Power > Power Mode > Performance
# Settings > Power > General > Show Battery Percentage > On
# Settings > Mouse & Touchpad > Touchpad > Scroll Direction > Traditional
# Settings > Multitasking > Active Screan Edges > On
# Settings > Multitasking > Multi-Monitor > Workspaces on all displays
# Settings > Notifications > Do Not Disturb > On

# ----------------------------------------------------------
# gnome tweaks
# ----------------------------------------------------------
# Windows > Focus on Hover

echo 'GNOME extensions install/config: https://github.com/fishberg/gnome-extensions-setup'

gnome-shell --version

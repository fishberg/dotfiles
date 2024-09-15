#!/usr/bin/env bash

# show commands
set -x

# gnome
sudo apt install -y gnome-session gnome-tweaks

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
# Settings > Multitasking > Active Screan Edges > On
# Settings > Multitasking > Multi-Monitor > Workspaces on all displays
# Settings > Notifications > Do Not Disturb > On

# ----------------------------------------------------------
# gnome tweaks
# ----------------------------------------------------------
# Windows > Focus Follows Mouse

echo 'read script comments for additional config settings'

# ----------------------------------------------------------
# system monitor applet
# ----------------------------------------------------------
# Updated Fork:
# * https://extensions.gnome.org/extension/3010/system-monitor-next/
# * https://github.com/mgalgs/gnome-shell-system-monitor-applet
#
# Original:
# * https://extensions.gnome.org/extension/120/system-monitor/
# * https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet
sudo apt install gnome-shell-extensions
echo 'install extension: https://extensions.gnome.org/extension/3010/system-monitor-next/'
# gnome-shell --version

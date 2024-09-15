#!/usr/bin/env bash

# show commands
set -x

# ----------------------------------------------------------
# Chromium (Gmail / Google Calendar)
# ----------------------------------------------------------
sudo apt install chromium

# ----------------------------------------------------------
# Signal Desktop
# ----------------------------------------------------------
# https://signal.org/download/

# 1. Install our official public software signing key:
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# 2. Add our repository to your list of repositories:
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install Signal:
sudo apt update && sudo apt install signal-desktop

# cleanup gpg key
rm signal-desktop-keyring.gpg

# ----------------------------------------------------------
# Obsidian
# ----------------------------------------------------------
# https://obsidian.md/download

sudo snap install obsidian --classic

# ----------------------------------------------------------
# Todoist
# ----------------------------------------------------------
# https://todoist.com/downloads/linux

sudo snap install todoist

# inhibit refreshes of snaps while running
sudo snap set core experimental.refresh-app-awareness=true

# ----------------------------------------------------------
# Slack
# ----------------------------------------------------------
# https://slack.com/downloads/linux

sudo snap install slack

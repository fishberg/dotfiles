#!/usr/bin/env bash

# https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet

# sets show commands as they run
set -x

# install prerequisites
sudo apt install gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 gnome-system-monitor

# install gnome-shell-extensions
sudo apt install gnome-shell-extensions

# build and install
cd build
git clone https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet
cd gnome-shell-system-monitor-applet
make install

# enable extension
gnome-extensions enable system-monitor@paradoxxx.zero.gmail.com

# unsets show commands as they run
set +x



# Attempting to download the latest zip

# https://stackoverflow.com/questions/24987542/is-there-a-link-to-github-for-downloading-a-file-in-the-latest-release-of-a-repo

#GITHUB_USER=paradoxxxzero
#GITHUB_PROJECT=gnome-shell-system-monitor-applet

#TARGET=$(curl -s https://api.github.com/repos/$GITHUB_USER/$GITHUB_PROJECT/releases/latest) # | grep browser_download_url | cut -d '"' -f 4)
#echo $TARGET
#wget -qO- $TARGET | busybox unzip -

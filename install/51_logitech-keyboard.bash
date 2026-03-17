#!/usr/bin/env bash

# show commands
set -x

sudo apt install -y solaar

sudo udevadm control --reload-rules && sudo udevadm trigger

# sudo solaar
# K400 Plus > Swap Fx function > Off

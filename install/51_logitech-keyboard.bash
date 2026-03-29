#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

sudo apt install -y solaar

sudo udevadm control --reload-rules && sudo udevadm trigger

# sudo solaar
# K400 Plus > Swap Fx function > Off

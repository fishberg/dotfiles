#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# webcam
sudo apt install -y cheese

# qr code
sudo apt install -y qrencode

# barcode
sudo apt install -y zint

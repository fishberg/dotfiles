#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# python3
sudo apt install -y python-is-python3 python3-pip python3-venv

# system install
sudo apt install -y python3-numpy python3-matplotlib python3-pandas python3-scipy python3-tabulate python3-termcolor

# install pipx
sudo apt install -y pipx

# jupyter
pipx install jupyterlab --include-deps --force
pipx install nbstripout
pipx install nbdime
pipx install jupytext

# userful tools
pipx install grip
pipx install yt-dlp

## allow pip to install without venv
#sudo mv /usr/lib/python3.12/EXTERNALLY-MANAGED /usr/lib/python3.12/disabled_EXTERNALLY-MANAGED
#
#pip install numpy
#pip install matplotlib
#pip install pandas
#pip install scipy
#pip install jupyterlab
#pip install nbstripout
#pip install tabulate
#pip install termcolor
#pip install grip
#pip install tmuxp

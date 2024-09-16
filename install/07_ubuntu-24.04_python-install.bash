#!/usr/bin/env bash

# show commands
set -x

# python3
sudo apt install -y python-is-python3 python3-pip

# allow pip to install without venv
sudo mv /usr/lib/python3.12/EXTERNALLY-MANAGED /usr/lib/python3.12/disabled_EXTERNALLY-MANAGED

pip install numpy
pip install matplotlib
pip install pandas
pip install scipy
pip install jupyterlab
pip install nbstripout
pip install tabulate
pip install termcolor
pip install grip
pip install tmuxp

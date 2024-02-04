#!/usr/bin/env bash

# variables
NOTEBOOK_NAME="add-gnome-hotkeys"
PYTHON_NAME=".$NOTEBOOK_NAME"

# convert ipynb to py
jupyter nbconvert $NOTEBOOK_NAME.ipynb --to python --output=$PYTHON_NAME 2> /dev/null

# make runable
chmod +x $PYTHON_NAME.py

# run with parameters to this script
./$PYTHON_NAME.py $@

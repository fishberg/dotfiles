#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$0")
gnome-terminal -- bash -c "python $SCRIPT_DIR/references-insert.py; echo; read -p \"Press enter to continue\""

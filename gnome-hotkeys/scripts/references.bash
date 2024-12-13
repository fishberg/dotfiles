#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$0")
python $SCRIPT_DIR/references.py
nautilus --new-window ~/storage/references

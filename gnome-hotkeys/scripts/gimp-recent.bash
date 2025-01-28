#!/usr/bin/env bash

# Get most recent file
# https://stackoverflow.com/a/1015684

# Disable ls alias with \ls (disables color)
# https://unix.stackexchange.com/a/107372

RECENT="$(\ls -Art ~/Pictures/Screenshots/*.png | tail -n -1)"
gimp "$RECENT"

#!/usr/bin/env bash

# References:
# - `find /tmp/demo -maxdepth 0 -empty -exec echo {} is empty. \;`
# -- https://www.cyberciti.biz/faq/linux-unix-shell-check-if-directory-empty/
# - using find prune
# -- https://stackoverflow.com/a/16595367
# - use `rmdir`
# -- https://stackoverflow.com/a/23122112

# storage location
STORAGE_DIR=~/storage
YEAR=$(date "+%Y")
TODAY=$(date "+%F")

# create today's directory
mkdir -p $STORAGE_DIR/$YEAR/$TODAY

# remove empty directories (if they aren't todays)
# only search this year's folder
find $STORAGE_DIR/$YEAR/* -maxdepth 0 -not \( -path $STORAGE_DIR/$YEAR/$TODAY -prune \) -type d -empty -exec rmdir -v {} \;

# open in nautilus
nautilus --new-window $STORAGE_DIR/$YEAR/$TODAY

#!/usr/bin/env bash

# Reference:
# https://stackoverflow.com/questions/1423352/source-all-files-in-a-directory-from-bash-profile

# source globals
for f in $DOTFILES_ROOT/bash/global/*; do
    source $f
done

# source locals
LOCAL_DIR=$DOTFILES_ROOT/bash/local/$(hostname)
if [[ -e $local_dir ]]; then
    for f in $LOCAL_DIR/*; do
        source $f
    done
fi

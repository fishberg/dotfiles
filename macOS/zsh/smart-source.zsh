#!/usr/bin/env zsh

# source globals
for f in $DOTFILES_ROOT/macOS/zsh/global/*; do
    source $f
done

# source locals
LOCAL_DIR=$DOTFILES_ROOT/macOS/zsh/local/$(hostname -s)
if [[ -e $LOCAL_DIR ]]; then
    for f in $LOCAL_DIR/*; do
        source $f
    done
fi

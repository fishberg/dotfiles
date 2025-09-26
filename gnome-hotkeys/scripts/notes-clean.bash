#!/usr/bin/env bash

# delete any empty files in notes directory and subdirectories
find $HOME/dirs/notes/ -type f -empty -delete
# delete any empty directories in notes directory and subdirectories
find $HOME/dirs/notes/ -type d -empty -delete

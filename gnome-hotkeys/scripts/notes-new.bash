#!/usr/bin/env bash
#gnome-text-editor -n $(mktemp -t "$(date "+%Y-%m-%d_%H-%M-%S")_XXXXXXXX.txt" -p $HOME/dirs/notes)
source notes-clean.bash
DATE=$(date "+%Y-%m-%d")
TIME=$(date "+%H-%M-%S")
FILENAME="${DATE}_${TIME}_XXXXXXXX.txt"
TARGET_DIR="$HOME/dirs/notes/$DATE"
mkdir -p "$TARGET_DIR"
TARGET_FILE=$(mktemp -t "$FILENAME" -p "$TARGET_DIR")
gnome-text-editor -n "$TARGET_FILE"
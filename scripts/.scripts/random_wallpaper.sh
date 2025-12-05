#!/usr/bin/env bash

SRC_DIR=~/.wallpapers
DEST_FILE=~/.cache/current_wallpaper.png

# select random wallpaper from SRC_DIR
WALLPAPER="$(fd . $SRC_DIR | shuf -n 1)"

# create a symlink to the selected wallpaper
ln -sf "$WALLPAPER" "$DEST_FILE"

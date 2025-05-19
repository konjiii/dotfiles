#!/usr/bin/env bash

WALLPAPER_DIR=~/.config/hypr/wallpapers
WALLPAPER="$(fd . $WALLPAPER_DIR | shuf -n 1)"

cp "$WALLPAPER" "$WALLPAPER_DIR/current.png"

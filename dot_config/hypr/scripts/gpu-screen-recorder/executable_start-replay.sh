#!/bin/sh

video_path="$HOME/media/Videos/clips"
mkdir -p "$video_path"
gpu-screen-recorder -w DP-1 -f 60 -a "$(pactl get-default-sink).monitor" -c mp4 -r 300 -o "$video_path"

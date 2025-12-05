#!/usr/bin/env bash

app_name="volume-notifier"

# get current volume and mute status from wpctl
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
# get mute status
mute_status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "\[MUTED\]")

if [[ -n "$mute_status" ]]; then
    icon=audio-volume-muted
elif [[ $volume -le 33 ]]; then
    icon="audio-volume-low"
elif [[ $volume -le 66 ]]; then
    icon="audio-volume-medium"
else
    icon="audio-volume-high"
fi

# Show the volume notification
notify-send\
    -t 2000\
    -u low\
    -a $app_name\
    -i /usr/share/icons/breeze-dark/status/24/$icon.svg\
    -h int:value:$volume\
    -h string:x-canonical-private-synchronous:volume\
    "Volume: $volume%"

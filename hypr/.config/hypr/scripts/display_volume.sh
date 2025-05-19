#!/usr/bin/env bash

msgTag="volume/brightness"

# Change the volume using alsa(might differ if you use pulseaudio)
# amixer -c 0 set Master "$@" > /dev/null

# Query pamixer for the current volume and whether or not the speaker is muted
volume="$(pamixer --get-volume)"
mute="$(pamixer --get-mute)"

if [[ $volume -le 33 ]]; then
    icon="audio-volume-low"
elif [[ $volume -le 66 ]]; then
    icon="audio-volume-medium"
else
    icon="audio-volume-high"
fi

if [[ $volume == 0 || "$mute" == true ]]; then
    # Show the sound muted notification
    dunstify \
        -a "changeVolume/Brightness" \
        -u low \
        -i /usr/share/icons/breeze-dark/status/24/audio-volume-muted.svg \
        -h string:x-dunst-stack-tag:$msgTag \
        -h int:value:$volume "Volume: $volume%" "Volume muted"
else
    # Show the volume notification
    dunstify \
        -a "changeVolume/Brightness" \
        -u low \
        -i /usr/share/icons/breeze-dark/status/24/$icon.svg \
        -h string:x-dunst-stack-tag:$msgTag \
        -h int:value:$volume "Volume: $volume%"
fi

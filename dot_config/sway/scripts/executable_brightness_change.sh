#!/bin/sh
# changeVolume

# Arbitrary but unique message tag
msgTag="volume"

# Change the volume using alsa(might differ if you use pulseaudio)
# amixer -c 0 set Master "$@" > /dev/null

# Query pamixer for the current volume and whether or not the speaker is muted
max_brightness=$(brightnessctl m)
brightness=$(brightnessctl g)
brightness=$(($brightness * 100 / $max_brightness))
echo $brightness

# Show the volume notification
dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
-h int:value:"$brightness" "Brightness: ${brightness}%"

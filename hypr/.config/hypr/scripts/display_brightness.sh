#!/bin/sh

msgTag="volume/brightness"

# Change the volume using alsa(might differ if you use pulseaudio)
# amixer -c 0 set Master "$@" > /dev/null

# Query pamixer for the current volume and whether or not the speaker is muted
max_brightness=$(brightnessctl m)
brightness=$(brightnessctl g)
brightness=$(($brightness * 100 / $max_brightness))

if [[ $brightness -eq 0 ]]; then
    icon="brightness-full"
elif [[ $brightness -le 25 ]]; then
    icon="brightness-low"
elif [[ $brightness -le 50 ]]; then
    icon="brightness-medium"
elif [[ $brightness -le 75 ]]; then
    icon="brightness-high"
else
    icon="brightness-full"
fi

# Show the volume notification
dunstify \
    -a "changeVolume/Brightness" \
    -u low \
    -i /usr/share/icons/Papirus/48x48/status/notification-display-$icon.svg \
    -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$brightness" "Brightness: ${brightness}%"

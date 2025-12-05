#!/usr/bin/env bash

app_name="brightness-notifier"

# get brightness level using brightnessctl
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

# Show the brightness notification
notify-send\
    -t 2000\
    -u low\
    -a $app_name\
    -i /usr/share/icons/Papirus/48x48/status/notification-display-$icon.svg \
    -h int:value:$brightness\
    -h string:x-canonical-private-synchronous:brightness\
    "Brightness: $brightness%"


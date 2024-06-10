#!/bin/sh

# check if the number of arguments is correct
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <change> [--notif]"
    exit 1
fi

change=$1
re='^[+-]?[0-9]+$'

# check if the argument is a number
if ! [[ $change =~ $re ]] ; then
    echo "error: Not a number" >&2; exit 1
fi

# calculate the new brightness
brightness=$(ddcutil getvcp 10 | awk '{print $9}' | tr -d ,)
max_brightness=$(ddcutil getvcp 10 | awk '{print $13}')
change=$(($change * $max_brightness / 100))
brightness=$(($brightness + $change))

# make sure the brightness is in the correct range
brightness=$(($brightness < $max_brightness ? $brightness : $max_brightness))
brightness=$(($brightness > 0 ? $brightness : 0))

# change the brightness
ddcutil -d 1 setvcp 10 $brightness
ddcutil -d 2 setvcp 10 $brightness

if [ "$#" -eq 2 ] && [ "$2" = "--notif" ]; then
    # changeVolume

    # Arbitrary but unique message tag
    msgTag="volume"

    # Get the current brightness in percentage
    brightness=$(($brightness * 100 / $max_brightness))
    echo $brightness

    # Show the volume notification
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$brightness" "Brightness: ${brightness}%"

fi

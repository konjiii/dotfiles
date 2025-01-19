#!/bin/bash
while true; do
    capacity=$(cat /sys/class/power_supply/BAT1/capacity)
    status=$(cat /sys/class/power_supply/BAT1/status)
    # show battery low notification
    if [ "$capacity" -le 20 ] && [ "$status" != "Charging" ]; then
        dunstify -r 1 --urgency=CRITICAL "❗ Battery Low"
        sleep 120
    # show battery high notification
    elif [ "$capacity" -ge 80 ] && [ "$status" = "Charging" ]; then
        dunstify -r 1 "🔋 Battery > 80%"
        sleep 120
    # close battery notification
    else
        dunstctl close 1
        sleep 120
    fi
done

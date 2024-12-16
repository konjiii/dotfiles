#!/bin/bash
while true; do
    capacity=$(cat /sys/class/power_supply/BAT1/capacity)
    status=$(cat /sys/class/power_supply/BAT1/status)
    if [ "$capacity" -le 20 ] && [ "$status" != "Charging" ]; then
        dunstify --urgency=CRITICAL "Battery Low" "Level: ${capacity}%"
        sleep 1200
    else
        sleep 120
    fi
done

#!/usr/bin/env bash

app_name="battery-checker"

while true; do
    capacity=$(cat /sys/class/power_supply/BAT1/capacity)
    status=$(cat /sys/class/power_supply/BAT1/status)
    # show battery low notification
    if [ "$capacity" -le 20 ] && [ "$status" != "Charging" ]; then
        notify-send\
            -a $app_name\
            -t 10000\
            -u critical\
            -h string:x-canonical-private-synchronous:battery\
            "❗ Battery Low"
        sleep 120
        # show battery high notification
    elif [ "$capacity" -ge 80 ] && [ "$status" = "Charging" ]; then
        notify-send\
            -a $app_name\
            -t 10000\
            -u critical\
            -h string:x-canonical-private-synchronous:battery\
            "🔋 Battery > 80%"
        sleep 120
    fi
done

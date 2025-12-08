#!/bin/bash

app_name="protonvpn-toggler"

# Check if the proton0 interface exists
if ip link show proton0 > /dev/null 2>&1; then
    # It exists, so we are connected -> Disconnect
    notify-send\
        -t 5000\
        -u low\
        -a $app_name\
        -h string:x-canonical-private-synchronous:vpn-toggler\
        "VPN" "Disconnecting from VPN..."

    protonvpn disconnect 2> /dev/null
    notify-send\
        -t 5000\
        -u low\
        -a $app_name\
        -h string:x-canonical-private-synchronous:vpn-toggler\
        "VPN" "Disconnected."

else
    # It doesn't exist, so we are disconnected -> Connect
    notify-send\
        -t 5000\
        -u low\
        -a $app_name\
        -h string:x-canonical-private-synchronous:vpn-toggler\
        "VPN" "Connecting to VPN..."

    out=$(protonvpn connect 2> /dev/null)
    notify-send\
        -t 5000\
        -u low\
        -a $app_name\
        -h string:x-canonical-private-synchronous:vpn-toggler\
        "VPN" "$out"
fi

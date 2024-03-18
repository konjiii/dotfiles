#!/bin/bash

deviceid=$(xinput | grep ⎜ | grep Logitech | grep "Receiver  " | awk '{print $6}' | sed 's/id=//g')

xinput --set-prop $deviceid "libinput Accel Profile Enabled" 0 1 0

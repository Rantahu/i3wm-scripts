#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

mkdir /etc/alsa
cp asound.dp-connected asound.dp-disconnected dp-switch.sh /etc/alsa/
/etc/alsa/dp-switch.sh

cp 90-dp.rules /etc/udev/rules.d/
udevadm control --reload-rules

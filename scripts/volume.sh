#!/bin/bash
if (amixer sget PCM | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null); then
    notify-send-t 2000 -r 2593 -u normal "Volume: Mute"
else
    #volume=amixer sget PCM | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
    volume=`pulsemixer --get-volume | cut -d " " -f 2`
    notify-send -t 2000 -r 2593 -u normal -h int:value:"$volume" "Volume: ${volume}%"
fi

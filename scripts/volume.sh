#!/bin/bash
if [[ $(pactl get-sink-mute $(pactl get-default-sink) | cut -d ' ' -f 2) = "yes" ]]; then
    notify-send -t 2000 -r 2593 -u normal "Volume: Mute"
else
	volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | sed '$d')
    notify-send -t 2000 -r 2593 -u normal -h int:value:"$volume" "Volume: ${volume}%"
fi

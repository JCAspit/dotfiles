#!/bin/bash
if [[ $(pactl get-source-mute $(pactl get-default-source) | cut -d ' ' -f 2) = "yes" ]]; then
    #echo "%{F#F0C674}Muted %{F#707880}"
    echo "%{F#707880}muted %{F#707880}"
else
	volume=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -oP '\d+(?=%)' | sed '$d')
    echo "${volume}% "
fi

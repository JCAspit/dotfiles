#!/usr/bin/env bash

# Something was taking 0.05 seconds to update and this fixed it
# idk :v
sleep 0.05

# The command playerctl sends its output to error output instead of standard output by default
# "-l 2>&1" tells it to send its output to standard output
if [[ $(playerctl metadata -l 2>&1) != "No players found" && $(playerctl status) == "Playing" ]]; then

	if [[ ! -f /tmp/song-info ]]; then
		echo "" > /tmp/song-info
	fi

	title=$(playerctl metadata title)
	artist=$(playerctl metadata artist)
	art=$(playerctl metadata mpris:artUrl)

	info_old=$(cat /tmp/song-info)
	info_new="$title-$artist-$art"
	if [[ $info_new != $info_old ]]; then
		echo $info_new > /tmp/song-info

		cd /tmp/
		curl $art -o "/tmp/spotify-art.webp"
	fi

	notify-send -t 2055 --icon "/tmp/spotify-art.webp" "$title" "$artist"

fi

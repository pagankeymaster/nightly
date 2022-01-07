#!/bin/env bash

FILE="$XDG_CACHE_HOME/redshift_launch"
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	redshift &
	dunstctl close
	dunstify -a "nightmode" -i "nightmode-on" "Nightmode" "Nightmode has been turned on"
else
	killall redshift &
	rm "$FILE"
	dunstctl close
	dunstify -a "nightmode" -i "nightmode-off" "Nightmode" "Nightmode has been turned off"
fi

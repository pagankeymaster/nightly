#!/usr/bin/env bash

source "$XDG_CONFIG_HOME/bspwm/theme.zsh"

IFS='x' read -r w h < <(xdpyinfo | awk '/dimensions/ {print $2}')
eval "$(xdotool getactivewindow getwindowgeometry --shell)"
xdotool getactivewindow windowmove $((w/2-WIDTH/2-4)) $((h/2-HEIGHT/2-3))
notify-send -a sxhkd SXHKD "Node <span font_weight='bold' foreground='$yellow'>$(xdotool getwindowclassname $WINDOW)</span> has been centered."
unset WINDOW X Y WIDTH HEIGHT SCREEN

# vim:filetype=sh
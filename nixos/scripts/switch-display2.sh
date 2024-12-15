#!/usr/bin/env zsh

INTERNAL="eDP-1"
EXTERNAL="HDMI-1"

# Set the HDMI resolution to 2560x1080 with 60Hz and turn off the internal display
xrandr --output $EXTERNAL --mode 2560x1080 --rate 60 --output $INTERNAL --off

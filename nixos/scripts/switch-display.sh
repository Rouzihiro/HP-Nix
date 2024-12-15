#!/usr/bin/env zsh

INTERNAL="eDP-1"
EXTERNAL="HDMI-1"

xrandr --output $EXTERNAL --off --output $INTERNAL --auto


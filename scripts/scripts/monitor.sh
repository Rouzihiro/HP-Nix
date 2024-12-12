#!/bin/sh

# Check the status of the DPMS (screen power saving)
STATUS=$(hyprctl dispatch dpms status eDP-1)

if [[ "$STATUS" == *"off"* ]]; then
  # If screen is off, turn it on
  hyprctl dispatch dpms on eDP-1
else
  # Otherwise, turn it off
  hyprctl dispatch dpms off eDP-1
fi


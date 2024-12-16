#!/usr/bin/env zsh

brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)

# Perform floating-point division
percentage=$(echo "scale=2; $brightness * 100 / $max_brightness" | bc)

echo "Brightness: ${percentage}%"


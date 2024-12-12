#!/bin/zsh

# Get the current date and time
date_formatted=$(date "+%a %F %H:%M")

# Get battery info
battery_info=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state|percentage" | awk '{print $2}')

# Get the volume percentage using pamixer
audio_volume=$(pamixer --get-volume-human)

# Output the data to be shown in the bar
echo "$audio_volume $battery_info 🔋 $date_formatted"


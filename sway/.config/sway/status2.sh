#!/bin/zsh

while true; do
    # The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
    # and the time (e.g., 14:01).
    date_formatted=$(date "+%a %F %H:%M")

    # Battery info: state and percentage
    battery_info=$(upower --show-info $(upower --enumerate | grep 'BAT') | \
        egrep "state|percentage" | \
        awk '{print $2}' | tr '\n' ' ')

    # Volume info using amixer, output in human-readable format with emoji for mute
    audio_volume=$(amixer -M get Master | \
        awk '/Mono.+/ {print $6=="[off]" ? $4" 🔇" : $4" 🔊"}' | \
        tr -d '[]')

    # Output the formatted status
    echo "$audio_volume $battery_info🔋 $date_formatted"

    # Sleep for 1 second before updating again
    sleep 1
done


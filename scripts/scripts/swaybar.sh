#!/bin/zsh
# Simple Zsh script to generate continuous status output for swaybar

while true; do
    # Output status with system information
    echo "Time: $(date '+%H:%M:%S') | Load: $(uptime | awk '{print $10 $11 $12}') | Memory: $(free -h | awk '/^Mem/ {print $3 "/" $2}')"
    
    # Sleep for 1 second to prevent excessive CPU usage
    sleep 1
done


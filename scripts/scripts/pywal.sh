#!/bin/sh
# Apply pywal colors to Hyprland
wal -i ~/Pictures/wallpapers/active.jpg
cat $HOME/.cache/wal/colors.sh | sed 's/^export COLOR_/hyprland_color_/g' >> $HOME/.config/hyprland/colors.sh

# Reload Hyprland to apply colors
hyprctl reload


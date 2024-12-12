#!/bin/sh

# Directory containing wallpapers (symlink to the actual location in dotfiles)
WALLPAPERS_DIR="$HOME/Pictures/wallpapers"

# Check if the directory exists
if [[ ! -d "$WALLPAPERS_DIR" ]]; then
  echo "Error: Directory $WALLPAPERS_DIR does not exist."
  exit 1
fi

# Select a random wallpaper from the directory, following symlinks
RANDOM_WALLPAPER=$(find -L "$WALLPAPERS_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' -o -iname '*.bmp' \) | shuf -n 1)

# Check if a wallpaper was found
if [[ -z "$RANDOM_WALLPAPER" ]]; then
  echo "Error: No wallpapers found in $WALLPAPERS_DIR."
  exit 1
fi

# Set the wallpaper and generate a pywal color scheme
wal -i "$RANDOM_WALLPAPER"

# Output the selected wallpaper path
echo "Wallpaper changed to: $RANDOM_WALLPAPER"


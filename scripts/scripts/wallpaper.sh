#!/bin/sh

# Set the directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Check if the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
  echo "Wallpaper directory not found: $WALLPAPER_DIR"
  exit 1
fi

# Use Wofi to select a wallpaper from the directory
SELECTED=$(ls "$WALLPAPER_DIR" | wofi --show dmenu --prompt "Select Wallpaper" --height 20)

# If a wallpaper is selected, set it with swww
if [ -n "$SELECTED" ]; then
    # Full path to selected wallpaper
    SELECTED_PATH="$WALLPAPER_DIR/$SELECTED"
    
    # Check if the selected file exists
    if [ -f "$SELECTED_PATH" ]; then
        # Ensure swww command is in the PATH
        if command -v swww &> /dev/null; then
            # Use the correct swww subcommand to set the wallpaper
            swww img "$SELECTED_PATH"
            echo "Wallpaper set to: $SELECTED_PATH"
        else
            echo "swww command not found. Please install it."
            exit 1
        fi
    else
        echo "Selected wallpaper not found: $SELECTED_PATH"
        exit 1
    fi
else
    echo "No wallpaper selected."
    exit 1
fi


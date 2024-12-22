{ config, pkgs, ... }:

let
  # Define the custom Wofi configuration as a Nix expression
  wofiConfig = pkgs.writeText "wofi-config" ''
    # General Wofi settings for dark theme
    [main]
    border_width=2         # Border width
    border_radius=10       # Rounded corners
    opacity=90             # Window opacity (dark theme needs less transparency)
    padding=10             # Padding around the items
    columns=3              # Number of columns of items in the menu

    # Set the theme (dark)
    background="#2E3440"   # Dark background color
    foreground="#ECEFF4"    # Light text color (off-white)
    highlight="#88C0D0"     # Highlight color for selected items
    highlight_background="#3B4252"  # Background color for selected item
    selected="#BF616A"      # Red for urgent items
    selected_background="#4C566A"  # Slightly lighter background for urgent items

    # Font settings
    font="Noto Sans 14"     # Font and size

    # List settings
    lines=10                # Number of lines in the list
    line_height=40          # Height for each item

    # Shadow and border settings
    border_color="#4C566A"  # Subtle border color to match dark theme
    border_width=2          # Border width for the window
    shadow=true             # Enable shadow effect for the window

    # Icon settings
    icon_theme="Papirus-Dark"  # Icon theme to match dark aesthetic
    icon_size=24               # Size of the icons

    # Search box settings
    search_box=true            # Show search box at the top
    search_box_height=50       # Height of the search box
    search_box_padding=5       # Padding around the search box

  '';
in
{
  # Install Wofi package
  #home.packages = with pkgs; [
  #  wofi
  #];

  # Link the Wofi configuration file to the appropriate location
  environment.etc."wofi/config".source = wofiConfig;

}


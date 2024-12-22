{ config, pkgs, ... }:

let
  # Define the custom Rofi configuration as a Nix expression
  rofiConfig = pkgs.writeText "rofi-config" ''
    # General settings for Rofi
    rofi.theme: "dark"  # Use the dark theme

    # Main window settings
    window { 
      width: 50%;       # Window width (50% of the screen width)
      height: 20%;      # Window height (20% of the screen height)
      border: 2px;      # Border width
      radius: 10px;     # Border radius
      opacity: 90%;     # Window opacity (use a darker background for dark theme)
    }

    # List style
    listview {
      lines: 10;        # Number of lines to display
      fixed-height: true;
    }

    # Font and text settings
    font: "Noto Sans, 14";   # Font and size
    padding: 10px;           # Padding around the items

    # Colors for a dark theme
    background-color: #2E3440;   # Dark background
    foreground-color: #ECEFF4;   # Light text color (off-white)
    selected-background-color: #3B4252;   # Darker background for selected items
    selected-foreground-color: #88C0D0;   # Light blue text for selected items
    urgent-background-color: #BF616A;      # Red for urgent items
    urgent-foreground-color: #FFFFFF;      # White for urgent text

    # Border and shadows
    border-color: #4C566A;   # Subtle border color for the window
    border-width: 2px;       # Border width
    shadow: 0px 0px 10px rgba(0,0,0,0.5);  # Shadow effect for the window

    # Keybinding settings (optional)
    mode-keys: "Ctrl-Tab, Alt-Tab";  # Custom keybindings to switch modes (e.g., window-switching)
  '';
in
{

  # Link the Rofi configuration file to the appropriate location
  environment.etc."rofi/config".source = rofiConfig;

  # Optionally, you can also add custom keybindings or other behaviors
  # For example, here we can configure a Rofi shortcut in i3 or Hyprland
  # (adjust as needed):
  # home.file.".config/hyprland/config".text = ''
  #    bindsym $mod+d exec rofi -show drun
  # '';
}


{ config, pkgs, ... }:

let
  # Define the swaync configuration as a Nix expression
  swayncConfig = pkgs.writeText "swaync-config" ''
    # General settings for notifications
    text_color = "#FFFFFF"        # White text for readability
    background_color = "#2E3440"  # Dark background, fits with dark themes
    border_color = "#4C566A"      # Subtle border color
    icon_theme = "Papirus-Dark"   # Clean and modern icon theme
    max_age = 5000                # Time in milliseconds before a notification fades
    width = 400                   # Width of the notification
    height = 60                   # Height of the notification

    # Notification positioning
    position = "top-right"        # Position of the notification on screen
    padding = 10                  # Padding around the text and icon
    margin = 10                   # Margin from screen edges

    # Notification styles
    font = "Noto Sans"            # Clean and modern font
    font_size = 14                # Font size for better readability
    line_height = 1.5             # Line height to make text less cramped

    # Notification grouping (same type notifications grouped together)
    group_notifications = true    # Group notifications from the same app
    group_time = 500              # Time in milliseconds to group notifications

    # Icon handling
    icon_size = 24                # Set size for icons
    icon_margin = 10              # Margin between icon and text

    # Custom colors for specific notification types
    # Success notifications
    success_color = "#A3BE8C"     # Light green for success
    # Error notifications
    error_color = "#BF616A"       # Red for errors
    # Warning notifications
    warning_color = "#EBCB8B"     # Yellow for warnings
    # Information notifications
    info_color = "#88C0D0"        # Light blue for informational messages

    # Add specific apps' icons
    app_icons = [
      { app = "discord"; icon = "discord"; },
      { app = "firefox"; icon = "firefox"; }
    ]
  '';
in
{
#  # Install swaync
#  home.packages = with pkgs; [
#    swaync
#  ];

  # Link the swaync configuration file to the appropriate location
  environment.etc."swaync/config".source = swayncConfig;

  # Enable swaync as a user service through systemd
#  systemd.user.services.swaync = {
 #   description = "Sway Notification Daemon";
  #  after = [ "graphical.target" ];

   # serviceConfig = {
    #  ExecStart = "${pkgs.swaync}/bin/swaync";
     # Restart = "always";
      #Environment = [
      #  "WAYLAND_DISPLAY=wayland-0"
      #];
   # };

    #wantedBy = [ "default.target" ];
 # };

  # Set environment variables for swaync to work with Wayland
 # home.sessionVariables = {
 #   "WAYLAND_DISPLAY" = "wayland-0";
 # };
}


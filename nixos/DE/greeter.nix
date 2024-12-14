{ config, pkgs, ... }:
{
  # Enable greetd and its configuration
  services.greetd = {
    enable = true;
    #autologinUser = "rey"; # Replace with your username
    greeter = pkgs.gtkgreet;  # You can use pkgs.agreety or another greeter here
  };

  # Enable a default Wayland session
  services.displayManager = {
    enable = true;
    defaultSession = "hyprland"; # This sets the default session to Hyprland
  };

  }


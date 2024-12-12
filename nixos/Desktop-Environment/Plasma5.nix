{ config, pkgs, ... }:

{
  # Define the system configuration for NixOS
  imports =
    [ # Include the default NixOS configuration
      #./
    ];

  # Enable the KDE Plasma desktop environment
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
 services.xserver.displayManager.sddm.wayland .enable = true;

services.xserver.displayManager.defaultSession = "plasma";
#services.xserver.displayManager.defaultSession = "plasmawayland

environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  plasma-browser-integration
  konsole
  oxygen
];

qt = {
  enable = true;
  platformTheme = "gnome";
  style = "adwaita-dark";
};

}

{ config, pkgs, ... }:

{
  # Define the system configuration for NixOS
  imports =
    [ # Include the default NixOS configuration
      #./
    ];

  # Enable the KDE Plasma desktop environment
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;

environment.plasma6.excludePackages = with pkgs.kdePackages; [
  plasma-browser-integration
  konsole
  oxygen
];

services.xserver.displayManager.defaultSession = "plasma";

qt = {
  enable = true;
  platformTheme = "gnome";
  style = "adwaita-dark";
};

}

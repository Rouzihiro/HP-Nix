{ config, pkgs, ... }:

{

  # Enable the GNOME desktop environment
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

#  services.xserver.displayManager.gdm.wayland = true;

    services.gnome.core-shell.enable = true;

  # Enable some basic packages
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks # GNOME Tweaks tool
  ];

}

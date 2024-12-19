{ config, pkgs, ... }:
{

  services.getty.autologinUser = "rey";


  # Install Hyprland
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
  polkit
  polkit_gnome
  xdg-desktop-portal
  #hyprpaper
  hyprlock
  hypridle
  hyprshot
  hyprsunset
  #swaylock
  #sway
  gtk3
  gtk4
  #rofi-wayland
  waybar
  grim
  wl-clipboard
  #hsetroot

      ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-hyprland];
    config.preferred.default = ["hyprland" "gtk"];
    xdgOpenUsePortal = true;
  };

  }


{ config, pkgs, ... }:
{

  services.getty.autologinUser = "rey";


  # Install Hyprland
  programs.hyprland.enable = true;

  services.displayManager = {
    sessionPackages = [ pkgs.hyprland ];
    autoLogin.enable = true;
    autoLogin.user = "rey";
  };

  environment.systemPackages = with pkgs; [
  polkit_gnome
  xdg-desktop-portal
  hyprpaper
  hyprlock
  hypridle
  hyprshot
  hyprsunset
  sway
  gtk3
  gtk4
  rofi-wayland
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


{ config, pkgs, ... }:
{

  # Install LightDM
  #services.xserver.displayManager.lightdm.enable = true;

  # Install Hyprland
  programs.hyprland.enable = true;

  services.displayManager = {
    sessionPackages = [ pkgs.hyprland ];
    autoLogin.enable = true;
    autoLogin.user = "rey";
  };

  environment.systemPackages = with pkgs; [
    # other packages
  hyprpaper
  hyprlock
  hypridle
  hyprshot
  gtk3
  gtk4
  rofi-wayland
  waybar
      ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-hyprland];
    config.preferred.default = ["hyprland" "gtk"];
    xdgOpenUsePortal = true;
  };

  }

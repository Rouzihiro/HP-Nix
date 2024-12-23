{ config, pkgs, ... }:

{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Enable the XFCE components you need (optional)
  environment.systemPackages = with pkgs; [
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-power-manager
    xfce.xfce4-notifyd
    xfce.xfce4-screenshooter
    xfce.xfce4-terminal
    xfce.thunar
    xfce.xfce4-settings
    xfce.xfce4-panel
    xfce.xfce4-session
    xfce.xfce4-appfinder
    xfce.xfce4-taskmanager
  ];

  # Optional: Enable additional services or settings as needed
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.windowManager.i3.enable = true;

  # Other configuration options...
}

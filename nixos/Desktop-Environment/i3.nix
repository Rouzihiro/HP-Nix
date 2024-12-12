{ config, pkgs, lib, ... }:
{


  # Enable LightDM display manager
  services.xserver.displayManager.lightdm.enable = true;

  # Enable i3 window manager
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps; # Optional: Use i3-gaps for additional customization

  environment.systemPackages = with pkgs; [
    blueberry
    bluez
    nitrogen
    maim
    slop
    i3lock
    i3lock-fancy
    i3blocks
    i3status
    alacritty
    catppuccin-kvantum
    lxappearance
    ueberzugpp

    ];

  # System performance tweaks (optional)
  # powerManagement.cpuFreqGovernor = lib.mkDefault "performance";

}

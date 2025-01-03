{ config, pkgs, ... }:

{
  imports = [
    ./android
    ./cli
    ./gui
    ./misc
    ./tui
    ./virtualisation
   # ./hyprland.nix
    #./wm
  ];
}

{ pkgs, lib, config, ... }:

{
  imports = [
    ./brave.nix
    #./cursor.nix
    #./firefox.nix
    #./gimp.nix
    ./hypr
    ./swaync.nix
    ./rofi/default.nix
    #./spotify.nix
    #./vivaldi.nix
    #./vesktop
    ./waybar/waybar.nix
  ];

}

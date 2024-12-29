{ pkgs, ... }:

{
  imports = [
    ./brave.nix
    #./librewolf.nix
    #./cursor.nix
    #./firefox.nix
    #./gimp.nix
    ./hypr
    ./rofi/default.nix
    #./spotify.nix
    #./swaync.nix
    #./vivaldi.nix
    #./vesktop
    ./waybar/waybar.nix
    #./wofi/wofi.nix
  ];

}

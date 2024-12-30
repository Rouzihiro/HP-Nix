{ pkgs, ... }:

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
    #./swaync.nix
    #./vivaldi.nix
    #./vesktop
    ./waybar/waybar.nix
    #./wofi/wofi.nix
  ];

}

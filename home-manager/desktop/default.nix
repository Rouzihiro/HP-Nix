{ pkgs, ... }:

{
  imports = [
    ./brave.nix
    #./cursor.nix
    #./firefox.nix
    #./gimp.nix
    ./hypr
    ./rofi
    #./spotify.nix
    #./swaync.nix
    #./vivaldi.nix
    #./vesktop
    ./waybar/waybar.nix
    #./wofi/wofi.nix
  ];

}

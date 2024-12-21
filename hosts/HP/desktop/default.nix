{ pkgs, ... }:

{
  imports = [
    #./brave.nix
    #./cursor.nix
    #./firefox.nix
    #./gimp.nix
    #./rofi
    #./spotify.nix
    #./swaync.nix
    #./vivaldi.nix
    #./vesktop
    #./waybar/waybar.nix
    ./waybar.nix
    #./wofi/wofi.nix
  ];

}

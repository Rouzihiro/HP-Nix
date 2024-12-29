{ pkgs, ... }:

{
  imports = [
    ./brave.nix
    #./librewolf.nix
    #./cursor.nix
    #./firefox.nix
    #./gimp.nix
    ./hypr
    #./rofi
    #./rofi-zaney
    #./rofi.nix
    #./rofi-zaney/rofi.nix
    #./spotify.nix
    #./swaync.nix
    #./vivaldi.nix
    #./vesktop
    ./waybar/waybar.nix
    #./wofi/wofi.nix
  ];

}

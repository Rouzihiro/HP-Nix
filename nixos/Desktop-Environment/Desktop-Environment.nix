{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./i3.nix
      #./hyprland.nix
      #./gnome.nix
       ./pywal.nix   
      #./sway.nix
      #./sway-login-manager.nix
      #./xfce.nix
      #./Plasma5.nix   
    ];

}


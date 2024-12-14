{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      #./boot.nix
      ./greetd.nix
      #./i3.nix
      ./hyprland.nix
      ./waybar.nix
      ./qtile/default.nix
      #./gnome.nix
       ./pywal.nix   
      #./sway.nix
      #./sway-login-manager.nix
      #./xfce.nix
      #./Plasma5.nix   
    ];

}


{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./essentials.nix
      #.fonts.nix
      #./nautilus.nix
      #./thunar.nix
      ./shell.nix
      #./flatpak.nix
      ./polkit.nix
      ./portals.nix
      #./xserver.nix
    ];

}


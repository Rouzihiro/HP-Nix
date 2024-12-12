{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./essentials.nix
      ./nautilus.nix
      #./thunar.nix
      ./shell.nix
      #./flatpak.nix
    ];

}


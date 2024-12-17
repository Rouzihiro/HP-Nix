{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./cleaner.nix
      ./services.nix
      #./updater.nix
      ./portals.nix
      ./gnome-polkit.nix
    ];

}


{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./fonts.nix
    ./file-manager/default.nix
    ./swaync.nix
    ./wofi.nix
    #./bluetooth-blueman.nix
    #./ios.nix
    #./kernel.nix
    #./kernel2.nix
    #./light.nix
    #./zram.nix

  ];

 }

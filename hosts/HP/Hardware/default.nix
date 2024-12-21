{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./audio.nix
      ./battery.nix
      #./bluetooth-blueman.nix
      #./ios.nix
      #./kernel.nix
      #./kernel2.nix
      #./light.nix
      #./zram.nix

    ];

}


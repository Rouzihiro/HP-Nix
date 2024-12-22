{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./stylix.nix
    ./fonts.nix
      #./bluetooth-blueman.nix
      #./ios.nix
      #./kernel.nix
      #./kernel2.nix
      #./light.nix
      #./zram.nix


    ];


  programs = {
    #nix-ld.enable = true;
    #xfconf.enable = true;
   # fish.enable = true;
    #zsh.enable = true;
    dconf.enable = true;
  };


}


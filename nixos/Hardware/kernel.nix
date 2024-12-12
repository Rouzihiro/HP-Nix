{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  
  #boot.kernelPackages = unstable.linuxPackages_latest;
  boot.kernelPackages = unstable.linuxPackages_zen;

}

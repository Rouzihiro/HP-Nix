{ config, pkgs, lib, ... }:

let
  homeEssentials = import ./home-essentials.nix;
  homeDefault = import ./home-default.nix;
in {
  imports = [
    homeEssentials
    homeDefault
  ];

  home.username = "rey";
  home.homeDirectory = "/home/rey";
  home.stateVersion = "24.11";
  programs.zsh.enable = true;
  programs.home-manager.enable = true;


}


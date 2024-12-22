{ config, pkgs, lib, ... }:

let
  homeEssentials = import ./home-essentials.nix;
  homeDefault = import ./home-default.nix;
in {
  imports = [ homeEssentials homeDefault ];

  home.username = "rey";
  home.homeDirectory = "/home/rey";
  home.stateVersion = "24.11";
  programs.zsh.enable = true;
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Styling Options
  #stylix.targets.waybar.enable = false;
  #stylix.targets.rofi.enable = false;
  #stylix.targets.hyprland.enable = false;

#home.file."assets/active.jpg" = {
#  source = ./assets/active.jpg;
#};


}

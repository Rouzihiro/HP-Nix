{ inputs, config, pkgs, lib, ... }:

let
  homeEssentials = import ./home-essentials.nix;
  homeSway = import ./sway-home.nix;
  homeDefault = import ./../../home-manager/default.nix;
in {
  imports = [ homeEssentials homeDefault homeSway];

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    inputs.hyprland-qtutils.packages."${system}".default
    inputs.yt-x.packages."${system}".default
  ];

  home.username = "rey";
  home.homeDirectory = "/home/rey";
  home.stateVersion = "24.11";
  programs.zsh.enable = true;
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  #Styling Options
  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;
  stylix.targets.hyprland.enable = false;

}

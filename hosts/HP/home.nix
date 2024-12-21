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

  # Specify the Home Manager version
  home.stateVersion = "24.11";

  # Enable commonly used programs
  programs.zsh.enable = true;
  programs.home-manager.enable = true;

  # Set default options for the environment
  environment.variables = {
    EDITOR = "nvim";
    SHELL = "/bin/zsh";
  };


home.directories = {
  xdgDataHome = ".local/share";
  xdgConfigHome = ".config";
  xdgCacheHome = ".cache";
  xdgStateHome = ".local/state";
};



}


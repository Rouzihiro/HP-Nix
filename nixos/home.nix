{ config, pkgs, lib, ... }:

let
  username = "rey";
  homeDir = "/home/${username}";
in

{
  home.username = username;
  home.homeDirectory = homeDir;
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./home-manager/default.nix
    ./home-manager/home-essentials.nix
  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs = {
    gh.enable = true;
    btop = {
      enable = true;
      settings = { vim_keys = true; };
    };
  };

}


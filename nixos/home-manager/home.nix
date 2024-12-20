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
    ./default.nix
    ./home-essentials.nix
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

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };




}


{ config, pkgs, ... }:

{
  imports = [
    #./hyprland.nix
    ./android/default.nix
    ./cli/default.nix
    ./desktop/default.nix
    ./editors/default.nix 
    ./gaming/default.nix
    ./prompts/default.nix
    ./shells/default.nix
    ./terminals/default.nix
    ./virtualisation/default.nix
    ./ssh.nix
    ./git.nix

  ];
}

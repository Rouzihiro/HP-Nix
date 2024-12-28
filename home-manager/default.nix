{ config, pkgs, ... }:

{
  imports = [
    ./android/default.nix
    ./cli/default.nix
    ./desktop/default.nix
    ./editors/default.nix 
    ./prompts/default.nix
    ./shells/default.nix
    ./terminals/default.nix
    ./virtualisation/default.nix
    ./multimedia/default.nix
  ];
}

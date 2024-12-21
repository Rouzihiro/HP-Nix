{ config, pkgs, ... }:

{
  imports =
    [ 
      ./android/default.nix
      ./cli/default.nix
      ./desktop/default.nix
      ./editors/default.nix
      ./file-manager/default.nix
      ./gaming/default.nix
      ./prompts/default.nix
      ./shells/default.nix
      ./terminals/default.nix
      ./virtualisation/default.nix
      ./themes/default.nix

];
}


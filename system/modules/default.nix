{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./file-manager/default.nix
    ./swaync.nix
    ./wofi.nix
     ];

 }

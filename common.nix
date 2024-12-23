{ config, pkgs, ... }:

{
  imports = [
    ./home-manager/default.nix
    ./system/default.nix
  ];
}

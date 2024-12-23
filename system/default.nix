{ pkgs, ... }:

{
  imports = [
    ./Hardware/default.nix
    ./DE/default.nix
    ./GPU/default.nix
    ./system-essentials.nix
    ./modules/default.nix
    #./hyprland-base.nix
  ];
}

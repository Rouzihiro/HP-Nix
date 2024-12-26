{ pkgs, ... }:

{
  imports = [
    ./Hardware/default.nix
    ./DE/default.nix
    ./GPU/default.nix
    ./system-essentials.nix
    ./modules/default.nix
    ./themes/default.nix
    ./scripts/scripts.nix
    #./hyprland-base.nix
  ];
}

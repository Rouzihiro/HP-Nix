{ pkgs, ... }:

{
  imports = [
    # ./alacritty.nix
    # ./ranger.nix
    ./kitty.nix
    ./yazi.nix
    #./yazi-plugins.nix
  ];

}

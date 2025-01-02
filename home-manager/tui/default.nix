{ pkgs, ... }:

{
  imports = [
    # ./alacritty.nix
    # ./ranger.nix
    ./foot.nix
    ./kitty.nix
    ./yazi.nix
    ./neovim.nix
    #./yazi-plugins.nix
  ];

}

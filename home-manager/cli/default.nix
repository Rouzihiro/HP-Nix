{ pkgs, ... }:

{
  imports = [
    #./btop.nix
    # ./cava.nix
    #./direnv.nix
    ./fastfetch.nix
    ./git.nix
    ./ssh.nix
    ./zoxide.nix
  ];

}

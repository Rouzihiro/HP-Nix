{ pkgs, ... }:

{
  imports = [
    ./ani-cli.nix
    #./btop.nix
    # ./cava.nix
    #./direnv.nix
    ./fastfetch.nix
    ./git.nix
    ./ssh.nix
    ./zoxide.nix
  ];

}

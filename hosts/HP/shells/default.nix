{ pkgs, ... }:

{
  imports = [
    ./shell.nix
    #./tmux.nix
    ./zsh.nix
    #./zsh-buddy.nix
  ];

}

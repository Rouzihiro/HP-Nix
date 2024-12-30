{ pkgs, ... }:

{
  imports = [
    ./shell.nix
    #./tmux.nix
    ./zsh.nix
   # ./zsh-autosuggestion-untested.nix
  ];

}

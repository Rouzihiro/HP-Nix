{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    starship
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
    bat
    eza
    fzf
    curl
    rsync
  ];

}

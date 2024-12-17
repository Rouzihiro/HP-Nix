{ config, pkgs, ... }:
{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
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

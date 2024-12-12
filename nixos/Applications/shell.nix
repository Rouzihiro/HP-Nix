{ config, pkgs, ... }:
{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  zsh
  zsh-syntax-highlighting
  zsh-autosuggestions
  bat
  eza
  fzf
  curl
  rsync
  ];

programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

}

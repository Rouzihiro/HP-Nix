{ pkgs, ... }:

{
  imports = [
    ./btop.nix
    ./cava.nix
   # ./direnv.nix
    ./fastfetch.nix
    ./git.nix
   # ./starship.nix
   # ./tmux.nix
    ./zoxide.nix
  ];

#  home.packages = with pkgs; [
    # Development Tools 
 #   android-tools
   # fzf
  #  gcc
 #   lazygit
 #   live-server
 #   nixfmt-rfc-style
 #   ripgrep
 #   yt-dlp
 #   waypipe

    # Media Tools
 #   ani-cli
 #   brightnessctl
 #   cmatrix
 #   eza
 #   htop
 #   manga-cli
 #   nh
 #   playerctl
 #   zathura

    # File Management
 #   unzip
 #   zip

    # Other
#    ollama
#  ];
}

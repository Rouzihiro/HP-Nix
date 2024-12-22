{ config, pkgs, ... }:

{
  programs.wofi.enable = true;

  # Import the style.css file from the same directory as wofi.nix
  home.file."${config.home.homeDirectory}/.config/wofi/style.css" = {
    source =
      ./style.css; # This points to style.css located in the same directory as wofi.nix
  };
}

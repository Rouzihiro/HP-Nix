{ config, pkgs, ... }:

{
  # Styling Options
  stylix = {
    enable = true;
    polarity = "dark";
    #image = "./assets/active.jpg";
    base16Scheme= "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };

}

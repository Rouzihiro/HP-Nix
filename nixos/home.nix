{ config, pkgs, ... }:

let
  username = "rey";
  homeDir = "/home/${username}";
in

{
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = username;
  home.homeDirectory = homeDir;

  # Packages that should be installed to the user profile.
  home.packages = [ pkgs.htop pkgs.fortune ];

  # This value determines the Home Manager release that your configuration is compatible with.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

#  programs.emacs = {
#    enable = true;
#    extraPackages = epkgs: [ epkgs.nix-mode epkgs.magit ];
#  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}

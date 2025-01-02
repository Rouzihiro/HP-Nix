{ pkgs, ... }:

{
  services.xserver.windowManager.qtile = {
    enable = true;
    configFile = ./config.py;
    extraPackages =
      python3Packages: with python3Packages; [
        qtile-extras
      ];
  };

  environment.etc."xdg/qtile/theme.py".source = ./nord.py;

  # Session
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    excludePackages = [ pkgs.xterm ];
  };
}

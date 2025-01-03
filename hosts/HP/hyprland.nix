 { config, pkgs, inputs, ... }: {

  services.getty.autologinUser = "rey";

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  environment.systemPackages = with pkgs; [
    polkit
    polkit_gnome
    xdg-desktop-portal
    hyprlock
    hypridle
    hyprshot
    hyprsunset
    gtk3
    gtk4

  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
    config.preferred.default = [ "hyprland" "gtk" ];
    xdgOpenUsePortal = true;
  };

}

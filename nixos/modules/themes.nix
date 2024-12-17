{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # GTK Themes
    adw-gtk3            # Default Adwaita theme
    #materia-gtk-theme      # Materia as a backup option
    everforest-gtk-theme   # Everforest Dark theme
    
    # Icon Themes
    papirus-icon-theme
    breeze-icons

    # Tools for theme management
    nwg-look
  ];

  # Global GTK theme and icon configuration
  environment.variables = {
    GTK_THEME = "Everforest-Dark";   # Activates Everforest Dark by default
    GTK_ICON_THEME = "Papirus";     # Sets Papirus as the default icon theme
    XDG_CURRENT_DESKTOP = "Hyprland";  # For compatibility
    XDG_SESSION_TYPE = "wayland";   # Wayland session specification
  };
}


{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Theme / Style Related 
    pywal
    swaybg
    corefonts                 # Microsoft fonts for compatibility
    libnotify
    swaynotificationcenter    # System-wide notifications
    #feh #swww                # Wallpaper manager
    # redshift                # (x11) Adjust screen color temperature

    # System Utilities & Tools
    pass gnupg pinentry #security
    neovim
    openssl                   # Encryption toolkit
    stow                      # Manage dotfiles
    udev                      # Device manager
    pciutils                  # PCI utilities
    unzip zip unrar           # Compression tools
    ntfs3g                    # NTFS filesystem tools
    glib                      # Core libraries
    brightnessctl 
    killall
    # virt-viewer appimage-run yad playerctl
    # ansible ripgrep lshw bat pkg-config v4l-utils

    # Programming & Development
    gcc                       # GNU C compiler
    git                       # Version control system
    openjdk17                 # Java Development Kit
    # libgcc bc libvirt

    # Wayland Specific
    swaynotificationcenter
  ];
}

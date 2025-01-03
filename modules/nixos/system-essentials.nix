{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Theme / Style Related
    # hyprpanel
    
    #for Qtile
    wlr-randr
    #foot
    wayfire
    libinput
    wayland
    chromium # need for Hamburg-Events Script
    brave
    yazi
    kitty
    pywal
    corefonts # Microsoft fonts for compatibility
    libnotify
    swaynotificationcenter # System-wide notifications
    swww feh                # Wallpaper manager
    waybar
    # redshift                # (x11) Adjust screen color temperature

    # System Utilities & Tools
    tesseract grim slurp # needed for Screenshot - OCR script 
    cifs-utils
    # pass gnupg pinentry # security, not needed atm
    # nixfmt-rfc-style + auto formatting tool: nix-shell -p nixfmt; find . -type f -name "*.nix" -exec nixfmt {} +
    neovim
    openssl # Encryption toolkit
    stow # Manage dotfiles
    udev # Device manager
    pciutils # PCI utilities
    unzip zip unrar # Compression tools
    ntfs3g # NTFS filesystem tools
    glib # Core libraries
    brightnessctl
    killall
    # virt-viewer appimage-run yad playerctl
    # ansible ripgrep lshw bat pkg-config v4l-utils

    # Programming & Development
    gcc # GNU C compiler
    git # Version control system
    openjdk17 # Java Development Kit
    # libgcc bc libvirt
  ];
}

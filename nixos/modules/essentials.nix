{ config, pkgs, ... }:
{

nix.extraOptions = ''
  experimental-features = nix-command flakes
'';


  environment.systemPackages = with pkgs; [
    # Theme / Style Related
    nwg-look                  # Customize GTK and cursor themes
    corefonts                 # Microsoft fonts for better compatibility

    # File Management
    yazi                      # Best file manager for terminal
    pdfarranger               # PDF editor
    unzip                     # File decompression (ZIP)
    zip                       # File compression (ZIP)
    unrar                     # File decompression (RAR)

    # System Utilities & Tools
    neofetch                  # Display system information
    lxtask                    # Lightweight task manager
    pciutils                  # PCI device utilities
    openssl                   # Encryption toolkit
    stow                      # Manage dotfiles
    udev                      # Device manager for Linux

    # Programming & Development
    gcc                       # GNU C compiler
    git                       # Version control system
    openjdk17                 # Java Development Kit

    # File Searching / Navigation
    fd                        # Find files quickly
    fzf                       # Fuzzy finder for terminal
    jq                        # Parse JSON in the terminal
    poppler                   # PDF utilities (e.g., preview)
    zoxide                    # Directory jumper based on usage history

    # Media & Image Handling
    ffmpeg-full               # Multimedia framework
    imagemagick               # Image manipulation tool
    imv                       # Lightweight image viewer
    pinta                     # Simple image editor
    vlc                       # Media player

    # Browsers
    brave                     # Privacy-focused web browser

    # Communication
    discord
    telegram-desktop          # Messaging application
    thunderbird               # Email client
    zoom-us                   # Video conferencing
    
    # Wayland-Compatible Applications
    wofi                      # Application launcher for Wayland

    # X11-Specific Applications (excluded in future)
    #redshift                  # Adjust screen color temperature
    #catppuccin-gtk           # Catppuccin theme for GTK
    #qutebrowser              # Keyboard-focused web browser
    #librewolf                # Firefox fork for privacy
    #vivaldi                  # Chromium-based browser
    #falkon                   # Lightweight Qt-based web browser
    #xclip                    # Command-line clipboard utility
    #alacritty                # Terminal emulator
    #dunst                    # Notification daemon
    #epiphany                 # Lightweight GNOME web browser
    #gedit                    # Simple text editor
    #glxinfo                  # OpenGL information tool
    #polybar                  # Status bar
    #xorg.xinit               # X Window System initializer
  ];
}


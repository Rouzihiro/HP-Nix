{ config, pkgs, ... }:
{

nix.extraOptions = ''
  experimental-features = nix-command flakes
'';


  environment.systemPackages = with pkgs; [
    # Theme / Style Related
    nwg-look                  # Customize GTK and cursor themes
    corefonts                 # Microsoft fonts for better compatibility
    libnotify
    swaynotificationcenter
    swww

    # File Management
    yazi                      # Best file manager for terminal
    pdfarranger               # PDF editor
    unzip                     # File decompression (ZIP)
    zip                       # File compression (ZIP)
    unrar                     # File decompression (RAR)

    # System Utilities & Tools
    fastfetch                 # Display system information
    lxtask                    # Lightweight task manager
    pciutils                  # PCI device utilities
    openssl                   # Encryption toolkit
    stow                      # Manage dotfiles
    udev                      # Device manager for Linux
    # libgcc bc kdePackages.dolphin lxqt.lxqt-policykit libnotify v4l-utils ydotool
    # ripgrep lshw bat pkg-config brightnessctl virt-viewer
    # swappy appimage-run yad playerctl nh ansible
    
    # Programming & Development
    gcc                       # GNU C compiler
    git                       # Version control system
    openjdk17                 # Java Development Kit

    # go lua python3 python3Packages.pip uv clang zig rustup
    # nodePackages_latest.pnpm nodePackages_latest.yarn nodePackages_latest.nodejs
    # bun jdk maven gcc 

    # Remote Desktop and Collaboration Tools
    # anydesk

    # File Searching / Navigation
    killall
    tree
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
    vesktop 
    # element-desktop
    telegram-desktop          # Messaging application
    thunderbird               # Email client
    zoom-us                   # Video conferencing
    skypeforlinux

    # Network and internet tools
    aria2 # qbittorrent cloudflare-warp tailscale onedrive
    glib

    # Wayland specific
    # hyprshot hypridle grim slurp waybar dunst wl-clipboard swaynotificationcenter
    wofi                      # Application launcher for Wayland

    # System utilities


    # Virtualization
    # libvirt

    # File systems
    ntfs3g # os-prober

    # Downloaders
    # yt-dlp localsend

    # Clipboard managers
    cliphist

    # Fun and customization
    # cmatrix lolcat fastfetch onefetch microfetch socat cowsay 

    # Networking
    # networkmanagerapplet

    # Education
    # ciscoPacketTracer8 
    # wireshark ventoy

    # Music and streaming
    # youtube-music spotify

    # Miscellaneous
    # greetd.tuigreet

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

    # Version control and development tools
    # git gh lazygit lazydocker bruno gnumake coreutils nixfmt-rfc-style meson ninja

  # System monitoring and management
  # htop btop lm_sensors inxi auto-cpufreq nvtopPackages.nvidia anydesk

  ];
}


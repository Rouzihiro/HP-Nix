{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    # Theme / Style Related
    #hyprpanel
    nwg-look                  # Customize GTK and cursor themes
    # catppuccin-gtk           # Catppuccin theme for GTK

    # File Management
    yazi                      # Terminal file manager
    pdfarranger               # PDF editor
    # kdePackages.dolphin      # KDE file manager
    # lxqt.lxqt-policykit      # Lightweight PolicyKit configuration

    # User Utilities & Tools
    fastfetch                 # Display system information
    lxtask                    # Lightweight task manager
    tree                      # Directory viewer
    fd                        # File finder
    fzf                       # Fuzzy finder
    jq                        # JSON parser
    zoxide                    # Directory jumper
    cliphist                  # Clipboard manager
    eza                      # Modern replacement for `ls` with better formatting and icons
    
    ####################
    # Programming & Development
    ####################
    gcc                      # GNU Compiler Collection for C, C++, and other languages
    lazygit                  # Simple terminal-based Git UI
    live-server              # Development server with live reloading
    nixfmt-rfc-style         # Formatter for Nix files adhering to RFC standards
    ripgrep                  # Fast command-line search tool for finding text in files

    ####################
    # Media Tools
    ####################
    #yt-dlp                   # Download videos from YouTube and other platforms
    #waypipe                  # Wayland remote display tool for forwarding applications
    #ani-cli                  # CLI tool to stream or download anime
    brightnessctl            # CLI tool to adjust screen brightness
    cmatrix                  # "Matrix" screensaver for the terminal
    #htop                     # Interactive system monitor
    #manga-cli                # CLI manga downloader and reader
    #nh                       # CLI tool for accessing nhentai.net content
    #playerctl                # CLI media player controller
    zathura                  # Lightweight PDF viewer
    ffmpeg-full               # Multimedia utilities
    imagemagick               # Image manipulation tool
    imv                       # Lightweight image viewer
    #pinta                     # Image editor
    vlc                       # Media player
    mpv
    # yt-dlp                   # YouTube downloader
   
    # Browsers
    brave                     # Privacy-focused browser
    # qutebrowser              # Keyboard-focused web browser
    # librewolf                # Firefox fork for privacy
    # vivaldi                  # Chromium-based browser
    # falkon                   # Lightweight Qt-based web browser

    # Communication
    vesktop                   # Discord client
    telegram-desktop          # Messaging app
    thunderbird               # Email client
    zoom-us                   # Video conferencing
    skypeforlinux             # Skype client
    # element-desktop          # Decentralized messaging app
    # anydesk                  # Remote desktop client
    # localsend                # Local file sharing

    # Network and Internet Tools
    aria2                     # Download manager
    # qbittorrent              # Torrent client
    # cloudflare-warp          # VPN
    # tailscale                # Mesh VPN
    # onedrive                 # Cloud storage

    # Wayland Specific
    wofi                      # Application launcher for Wayland
    rofi                       # X11
    # hyprshot                 # Screenshot tool
    # hypridle                 # Idle manager
    # grim                     # Screenshot tool
    # slurp                    # Select region for screenshot
    # waybar                   # Wayland status bar
    # dunst                    # Notification daemon
    # wl-clipboard             # Clipboard manager

    # Miscellaneous
    # cmatrix                  # Matrix effect in terminal
    # lolcat                   # Colorize terminal output
    # onefetch                 # Git repository overview
    # cowsay                   # Fun ASCII art generator
    # greetd.tuigreet          # TUI greeter for Greetd

    # Education
    # ciscoPacketTracer8       # Networking simulator
    # wireshark                # Network analysis tool
    # ventoy                   # Bootable USB creator

    # Music and Streaming
    # youtube-music            # YouTube Music client
    # spotify                  # Music streaming client
  ];
}


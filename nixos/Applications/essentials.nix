{ config, pkgs, ... }:
{

nix.extraOptions = ''
  experimental-features = nix-command flakes
'';

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

wofi
nwg-look
#catppuccin-gtk
#qutebrowser
#librewolf
#vivaldi
#falkon

# yazi-tools

poppler 			# (for PDF preview)
jq      			# (for JSON preview)
poppler 			# (for PDF preview)
fd 				# (for file searching)
#rg 				# (for file content searching)
fzf 				# (for quick file subtree navigation)
zoxide 				# (for historical directories navigation)
imagemagick 			# (for SVG, Font, HEIC, and JPEG XL preview)
# xclip / wl-clipboard / xsel (for system clipboard support)

gcc
udev
#alacritty                   # Terminal emulator
#alsa-utils                  # Advanced Linux Sound Architecture (ALSA) utilities
#alejandra
#appimage-run                # Run AppImages
#appimagekit                 # AppImage tool
#audacious                   # Audio player
#autoconf                    # Configuration scripts
#binutils                    # Binary tools
brave                       # Web browser
#btop                         # Resource monitor
#cage                        # Wayland compositor
#calibre                     # E-book manager
#callPackage                 # Package manager
#cider                       # Music streaming
#cifs-utils                  # Network sharing
#clang                       # C language compiler
#claws-mail                   # eMail Client - lightweight
#clutter                     # UI toolkit for GNOME
#cmake                       # Build system
corefonts                    # Microsoft fonts
#coreutils                   # GNU utilities
#curl                        # Data transfer
dconf                        # Configuration system
#dash                        # POSIX shell
#deadbeef                    # Music player
#distrobox                   # Container manager
#dmidecode                   # System hardware info
#dunst                       # Notification daemon
#epiphany                     # BEST lightweight browser so far
#evolutionWithPlugins        # Email client
#eww                         # Window manager
ffmpeg-full                  # Multimedia framework
#fetchFromGitHub             # Fetch GitHub repository
#fetchpatch                  # Download patches
#filezilla                   # FTP client
#freefilesync                # File synchronization
#fuse                        # Filesystem utility
#galculator                  # Scientific calculator
#pkgs.gnome.geary
#gedit                        # Text editor
#gimp                        # Image editor
git                          # Version control
#gtk3                        # GTK toolkit
#gucharmap                   # Unicode character map
#gh                          # GitHub CLI
#glib                        # Core application library
#glxinfo                     # OpenGL info tool
#gnumake                     # Build automation tool
#grim                        # Screenshot utility
imv                          # Image viewer
openjdk17
#korganizer                  # Calendar
#libclang                    # C language library
#libnotify                   # Desktop notification library
#libreoffice-fresh           # Office suite
#libreoffice-qt               # Office suite (QT)
#libsecret                   # keyring / password store
lxtask                       # Lightweight task manager
#llvm                        # Compiler infrastructure
#media-downloader
#mpv                          # Media player
neofetch                     # System information
#nerdfonts                   # Developer fonts
#nextcloud-client            # Nextcloud client to sync Google Calendar via CalDAV
#ntfs3g                       # NTFS driver
#nfs-utils                    # NFS server utilities
#obs-studio                  # Video recording/streaming
#onlyoffice-bin              # Office suite
#openshot-qt                 # Video editor
#openvpn                     # VPN client
openssl                      # Encryption toolkit
#osmo                        # Calendar - best so far
#pantheon-tweaks             # Pantheon tweaks
pciutils                     # PCI device utilities
pdfarranger                  # PDF editor
#podman                      # Container engine
#polybar
#plymouth                    # Boot splash screen
#powershell                  # Command-line shell
pinta                        # Image editor
#qbittorrent                 # BitTorrent client
#rar                         # File archiver
redshift
rofi
#samba                       # File sharing
#screenfetch                 # System information
#simple-mtpfs                # Media Transfer Protocol (MTP) devices
#slurp                       # Screenshot tool for wlroots
#stdenv                      # Standard environment
stow
#swaycons                    # Sway icons
#synergy                     # Share keyboard/mouse
telegram-desktop             # Messaging application
thunderbird
#transmission                # BitTorrent client
#transmission-qt             # BitTorrent client
#ulauncher                   # Application launcher
unrar                        # Extract RAR files
unzip                        # File decompression
#uget                        # Download manager
#virtualglLib                # OpenGL utility
#virt-manager                # Virtual machine manager
vlc                          # Media player
#wf-recorder                 # Wayland screen recorder
#wget                        # Download utility
#xclip                       # Clipboard tool
#xorg.xinit                  # X Window System initializer
#yt-dlp
#ytmdesktop                  # YouTube Music desktop
yazi                         # Best Program EVER
zathura                      # Lightweight PDF viewer
zip
zoom-us                     # Video conferencing
zsh                          # Z shell

  ];
}

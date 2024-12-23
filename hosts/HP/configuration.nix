{ pkgs, ... }:

{
  imports = [
    ./../../system-default.nix
    ./hardware-configuration.nix
     ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  environment.variables.EDITOR = "nvim";
  nixpkgs.config.allowUnfree = true;

  # Define the 'rey' group
  users.groups.rey = { }; # Create the group 'rey'

  # Define the 'rey' user
  users.users.rey = {
    isNormalUser = true; # Mark as a normal user
    home = "/home/rey"; # Specify the home directory
    group = "rey"; # Assign 'rey' as the primary group
    extraGroups = [
      "wheel"
      "input"
      "video"
      "audio"
      "plugdev"
      "networkmanager"
      "docker"
      "power"
      "uucp"
      "seat"
    ];
    shell = pkgs.zsh; # Set Zsh as the default shell
  };

  security.sudo.enable = true;
  security.sudo.extraConfig = ''
    rey ALL=(ALL) NOPASSWD: ALL
  '';

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      trusted-users = [ "root" "@wheel" ];
      log-lines = 30;
      http-connections = 50;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };
  programs.zsh.enable = true;
  #users.users.rey.shell = pkgs.zsh;
  users.defaultUserShell = pkgs.zsh;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  services.libinput.touchpad.naturalScrolling =
    true; # Enable natural scrolling (macOS-style)

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    [

    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

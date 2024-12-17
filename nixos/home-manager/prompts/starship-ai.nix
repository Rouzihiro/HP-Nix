{ config, pkgs, ... }:

let
  starship = pkgs.starship;  # This will get Starship from Nixpkgs
in {
  # Install Starship shell prompt
  home.packages = with pkgs; [
    starship
  ];

  # Configure Starship to run on shell startup
  home.shellInit = ''
    # Initialize Starship as the prompt for supported shells
    if type -p starship > /dev/null; then
      export STARSHIP_CONFIG="${config.home.homeDirectory}/.config/starship.toml"
      eval "$(starship init zsh)"
    fi
  '';

  # Optional: Custom Starship configuration file
  home.file.".config/starship.toml".text = ''
    # Example Starship configuration file

    # Change prompt color
    [character]
    success_symbol = "[➜](bold green)"
    error_symbol = "[✗](bold red)"

    # Time format for prompt
    [time]
    format = "[$hour:$minute]($style)"
    style = "bold yellow"

    # Set Git status symbols
    [git_branch]
    format = "[$symbol$branch]($style)"
    symbol = ""
    style = "cyan"

    # Set Node version symbol
    [nodejs]
    format = "[$symbol$version]($style)"
    symbol = "🔷"
    style = "blue"

    # Add other configuration here based on your needs
  '';
}


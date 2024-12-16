{ config, pkgs, ... }:

let
  # Define your Starship configuration.
  starshipConfig = pkgs.writeText "starship.toml" ''
    # Starship Prompt Configuration

    [username]
    show_always = true
    style_user = "bold yellow"
    style_root = "bold red"

    [directory]
    truncation_length = 3
    truncation_symbol = "…/"
    style = "bold blue"

    [git_branch]
    symbol = " "
    style = "bold green"

    [git_status]
    stashed = "📦 "
    ahead = "⇡ "
    behind = "⇣ "
    diverged = "⇕ "
    untracked = "? "
    conflicted = "⚔ "
    modified = "✎ "
    staged = "✔ "
    deleted = "✖ "

    [nodejs]
    symbol = " "
    style = "bold cyan"

    [python]
    symbol = "🐍 "
    style = "bold yellow"

    [rust]
    symbol = "🦀 "
    style = "bold red"

    [time]
    format = "📅 [%Y-%m-%d] 🕒 [%H:%M:%S]"
    style = "bold magenta"

    [battery]
    full_symbol = "🔋 "
    charging_symbol = "⚡ "
    discharging_symbol = "🔌 "
    disabled = false

    [character]
    success_symbol = "❯ "
    error_symbol = "✗ "
    style = "bold white"
  '';
in

{
  # Add Starship to Home Manager configuration.
  programs.starship = {
    enable = true;
    config = starshipConfig;
  };

  # Optionally, ensure Zsh or Bash uses Starship as the default prompt.
  programs.zsh = {
    enable = true;
    promptInit = ''
      eval "$(starship init zsh)"
    '';
  };
}


{ config, ... }:

{
programs.starship = {
      enable = true;
      settings = with config.lib.stylix.colors.withHashtag; {
        add_newline = false;
        character = {
          success_symbol = "[λ](${base0A})";
          error_symbol = "[λ](${base0C})";
          vimcmd_symbol = "[Λ](${base0A})";
        };

        directory = {
          style = base0B;
          truncation_length = 5;
          truncate_to_repo = false;
          read_only = "";
        };

        git_branch.format = "[$branch](${base0A})";
        git_state.style = base0D;
        git_status = {
          format = "[$all_status$ahead_behind](${base0B}) ";
          stashed = "";
        };

        nix_shell.format = "[$state](${base0F}) ";

        cmd_duration.format = "[$duration](${base08})";

        right_format = "$cmd_duration";
        format = "$directory$git_branch$git_state$git_status$nix_shell$character";
        scan_timeout = 10;
      };
    };
  }


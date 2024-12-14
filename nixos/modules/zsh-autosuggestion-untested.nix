{ config, pkgs, lib, ... }:

let
  cfg = config.programs.zsh.autosuggestions;
in
{
  environment.systemPackages = with pkgs; [ zsh zsh-autosuggestions ];

  programs.zsh.autosuggestions = {
    enable = lib.mkEnableOption "zsh-autosuggestions";
    highlightStyle = lib.mkOption {
      type = lib.types.str;
      default = "fg=8"; # adjust to your preferred highlight style
      description = "Highlight style for suggestions";
    };
    strategy = lib.mkOption {
      type = lib.types.listOf (lib.types.enum [ "history" "completion" "match_prev_cmd" ]);
      default = [ "history" ]; # adjust to your preferred strategy
      description = "ZSH Autosuggestions strategy";
    };
    async = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Fetch suggestions asynchronously";
    };
    extraConfig = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Additional configuration values";
    };
  };

  programs.zsh.interactiveShellInit = ''
    source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="${cfg.highlightStyle}"
    export ZSH_AUTOSUGGEST_STRATEGY=(${builtins.concatStringsSep " " cfg.strategy})
    ${lib.optionalString (!cfg.async) "unset ZSH_AUTOSUGGEST_USE_ASYNC"}
    ${builtins.concatStringsSep "\\n" (lib.mapAttrsToList (key: value: "export ${key}=\"${value}\"") cfg.extraConfig)}
  '';
}


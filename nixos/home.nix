{ config, pkgs, ... }:


{


  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;
    ohMyZsh.plugins = [ "git" "thefuck" ];
    ohMyZsh.theme = "robbyrussell";
  };

 # programs.yazi = {
 #   enable = true;
 #   settings = {
 #     manager = {
 #       sort_by = "natural";
 #       sort_sensitive = true;
 #       sort_reverse = false;
 #       sort_dir_first = true;
 #       linemode = "none";
 #       show_hidden = true;
 #       show_symlink = true;
 #     };
      #editor = {
      #  command = "/etc/profiles/per-user/rey/bin/nvim";
      #};
      #filetypes = {
      #  "*.nix" = "nvim";
      #};
  #  };
 # };

  home.stateVersion = "24.11";
}


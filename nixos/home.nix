{ config, pkgs, ... }:

let
  username = "rey";
  homeDir = "/home/${username}";
in

{
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = username;
  home.homeDirectory = homeDir;

  # Packages that should be installed to the user profile.
  home.packages = [ pkgs.htop pkgs.fortune ];

  # This value determines the Home Manager release that your configuration is compatible with.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    #../../config/emoji.nix
    #../../config/hyprland.nix
    #../../config/neovim.nix
    #../../config/rofi/rofi.nix
    #../../config/rofi/config-emoji.nix
    #../../config/rofi/config-long.nix
    #../../config/swaync.nix
    #../../config/waybar.nix
    #../../config/wlogout.nix
    ./zsh.nix
  ];


#  programs.emacs = {
#    enable = true;
#    extraPackages = epkgs: [ epkgs.nix-mode epkgs.magit ];
#  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };


programs = {
    gh.enable = true;
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };
    kitty = {
      enable = true;
      package = pkgs.kitty;
      settings = {
        scrollback_lines = 2000;
        wheel_scroll_min_lines = 1;
        window_padding_width = 4;
        confirm_os_window_close = 0;
        #background_opacity = "0.5";
      };
      extraConfig = ''
        tab_bar_style fade
        tab_fade 1
        active_tab_font_style   bold
        inactive_tab_font_style bold
      '';
      };
	  yazi = {
		  enable = true;
      settings = {
			  manager = {
				sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
        };
        editor = {
        command = "/etc/profiles/per-user/rey/bin/nvim";
        #args = [ "--" ];
        };
      filetypes = {
      "*.nix" = "nvim";
    };
		};
    };

  zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "thefuck" ];
    theme = "robbyrussell";
  };

  # Add initExtra to load custom scripts and environment variables
  initExtra = ''
    fastfetch
    if [ -f $HOME/.zshrc-personal ]; then
      source $HOME/.zshrc-personal
    fi
  '';

    shellAliases = {
        sv = "sudo nvim";
        zu = "sh <(curl -L https://gitlab.com/Zaney/zaneyos/-/raw/main/install-zaneyos.sh)";
        ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
        v = "nvim";
        cat = "bat";
        ".." = "cd ..";
        cls = "clear";
        rey-utube-downloader = "./result/bin/youtube-downloader";
        md = "mkdir";
        psg = "ps aux | grep";
        rey-weatherHH = "curl -4 http://wttr.in/Hamburg";
        rey-weather = "curl -4 http://wttr.in/";

 extract = ''

          () {

            if [ -f $1 ] ; then

              case $1 in

                *.tar.bz2)   tar xvjf $1    ;;

                *.tar.gz)    tar xvzf $1    ;;

                *.tar.xz)    tar Jxvf $1    ;;

                *.bz2)       bunzip2 $1     ;;

                *.rar)       rar x $1       ;;

                *.gz)        gunzip $1      ;;

                *.tar)       tar xvf $1     ;;

                *.tbz2)      tar xvjf $1    ;;

                *.tgz)       tar xvzf $1    ;;

                *.zip)       unzip -d `echo $1 | sed 's/\(.*\)\.zip/\1/'` $1;;

                *.Z)         uncompress $1  ;;

                *.7z)        7z x $1        ;;

                *)           echo "don't know how to extract '$1'" ;;

              esac

            else

              echo "'$1' is not a valid file!"

            fi

          }'';

      };
 history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
  };

};
}

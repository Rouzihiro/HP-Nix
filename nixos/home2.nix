{
  pkgs,
  username,
  host,
  lib,
  config,
  ...
}:
#let
#  inherit (import ./variables.nix) gitUsername gitEmail;
 # dots = "/dotfiles";
#  scripts = "/home/${username}/zaneyos/scripts";
#in
{
  # Home Manager Settings
#  home.username = "${username}";
#  home.homeDirectory = "/home/${username}";
#  home.stateVersion = "23.11";

  # Import Program Configurations
  imports = [
 #   ../../config/emoji.nix
  #  ../../config/hyprland.nix
   # ../../config/neovim.nix
    #../../config/rofi/rofi.nix
   # ../../config/rofi/config-emoji.nix
   # ../../config/rofi/config-long.nix
   # ../../config/swaync.nix
   # ../../config/waybar.nix
   # ../../config/wlogout.nix
   # ./zsh.nix
  ];

  # Place Files Inside Home Directory
  # home.file."Pictures/wallpapers" = {
  #  source = ../../config/wallpapers;
  #  recursive = true;
  #};
   
   #home.file.".config/fastfetch" = {
   # source = ../../config/fastfetch;
   # recursive = true;
  #};
  #home.file.".config/wlogout/icons" = {
   # source = ../../config/wlogout;
   # recursive = true;
 # };
 # home.file.".face.icon".source = ../../config/face.jpg;
 # home.file.".config/face.jpg".source = ../../config/face.jpg;
 # home.file.".config/swappy/config".text = ''
  #  [Default]
  #  save_dir=/home/${username}/Pictures/Screenshots
  #  save_filename_format=swappy-%Y%m%d-%H%M%S.png
  #  show_panel=false
  #  line_size=5
   # text_size=20
    #text_font=Ubuntu
  #  paint_mode=brush
  #  early_exit=true
  #  fill_shape=false
  #'';

  # Install & Configure Git
 # programs.git = {
 #   enable = true;
 #   userName = "${gitUsername}";
 #   userEmail = "${gitEmail}";
 # };

  # Create XDG Dirs
  #xdg = {
  #  userDirs = {
  #    enable = true;
  #    createDirectories = true;
  #  };
  #};

 # dconf.settings = {
 #   "org/virt-manager/virt-manager/connections" = {
 #     autoconnect = [ "qemu:///system" ];
 #     uris = [ "qemu:///system" ];
 #   };
 # };

  # Styling Options
 # stylix.targets.waybar.enable = false;
 # stylix.targets.rofi.enable = false;
 # stylix.targets.hyprland.enable = false;
 # gtk = {
  #  iconTheme = {
  #    name = "Papirus-Dark";
 #     package = pkgs.papirus-icon-theme;
 #   };
 #   gtk3.extraConfig = {
 #     gtk-application-prefer-dark-theme = 1;
 #   };
 #   gtk4.extraConfig = {
 #     gtk-application-prefer-dark-theme = 1;
 #   };
 # };
 # qt = {
 #   enable = true;
 #   style.name = "adwaita-dark";
 #   platformTheme.name = "gtk3";
 # };


  # Scripts
  # home.packages = with pkgs; [
  #  (import ../../scripts/emopicker9000.nix { inherit pkgs; })
  # (import ../../scripts/task-waybar.nix { inherit pkgs; })
  #  (import ../../scripts/squirtle.nix { inherit pkgs; })
  #  (import ../../scripts/nvidia-offload.nix { inherit pkgs; })
  #  (import ../../scripts/wallsetter.nix {
  #    inherit pkgs;
  #    inherit username;
  #  })
  #  (import ../../scripts/web-search.nix { inherit pkgs; })
  #  (import ../../scripts/rofi-launcher.nix { inherit pkgs; })
  #  (import ../../scripts/screenshootin.nix { inherit pkgs; })
  #  (import ../../scripts/list-hypr-bindings.nix {
  #    inherit pkgs;
  #    inherit host;
  #  })
   
 # ];

  #services = {
  #  hypridle = {
  #    settings = {
  #      general = {
  #        after_sleep_cmd = "hyprctl dispatch dpms on";
  #        ignore_dbus_inhibit = false;
  #        lock_cmd = "hyprlock";
  #        starship = {
  #          enable = true;
  #          package = pkgs.starship;
  #        };
  #      };
  #      listener = [
  #        {
  #          timeout = 300;
  #          on-timeout = "hyprlock";
  #        }
   #       {
   #         timeout = 900;
   #         on-timeout = "hyprctl dispatch dpms off";
   #         on-resume = "hyprctl dispatch dpms on";
   #       }
   #     ];
   #   };
   # };
 # };

  programs = {
  #  gh.enable = true;
  #  btop = {
  #    enable = true;
  #    settings = {
  #      vim_keys = true;
  #    };
  #  };
  #  kitty = {
  #    enable = true;
  #    package = pkgs.kitty;
  #    settings = {
  #      scrollback_lines = 2000;
  #      wheel_scroll_min_lines = 1;
  #      window_padding_width = 4;
  #      confirm_os_window_close = 0;
  #      background_opacity = lib.mkForce "0.5";
  #    };
  #    extraConfig = ''
  #      tab_bar_style fade
  #      tab_fade 1
  #      active_tab_font_style   bold
  #      inactive_tab_font_style bold
  #    '';
  #    };
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
  #initExtra = ''
  #  fastfetch
  #  if [ -f $HOME/.zshrc-personal ]; then
  #    source $HOME/.zshrc-personal
  #  fi
  #'';

    shellAliases = {
        sv = "sudo nvim";
        #fr = "nh os switch --hostname ${host} /home/${username}/zaneyos";
        #fu = "nh os switch --hostname ${host} --update /home/${username}/zaneyos";
        #zu = "sh <(curl -L https://gitlab.com/Zaney/zaneyos/-/raw/main/install-zaneyos.sh)";
        #ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
        v = "nvim";
        cat = "bat";
        ls = "eza --icons";
        ll = "eza -lh --icons --grid --group-directories-first";
        la = "eza -lah --icons --grid --group-directories-first";
        ".." = "cd ..";
        cls = "clear";
        #rey-utube-downloader = "./result/bin/youtube-downloader";
        #rey-git-show = "zsh ${scripts}/rey-git-show.sh";
        #rey-script-permission = "zsh ${scripts}/script-folder-permission.sh";
        #rey-youtube-downloader = "zsh ${scripts}/youtube-downloader.sh";
        #rey-mount-Acer-HD = "zsh ${scripts}/mount-Acer-HD.sh";
        md = "mkdir";
        #rey-jdownloader = "zsh ${scripts}/jdownloader.sh";
        #psg = "ps aux | grep";
        #rey-weatherHH = "curl -4 http://wttr.in/Hamburg";
        #rey-weather = "curl -4 http://wttr.in/";

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
   
   home-manager.enable = true;
    hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 10;
          hide_cursor = true;
          no_fade_in = false;
        };
        background = [
          {
            path = "~/Pictures/lockscreen/VIM.png";
            blur_passes = 3;
            blur_size = 8;
          }
        ];
        image = [
          {
            path = "~/Pictures/avatars/naruto.png";
            size = 150;
            border_size = 4;
            border_color = "rgb(0C96F9)";
            rounding = -1; # Negative means circle
            position = "0, 200";
            halign = "center";
            valign = "center";
          }
        ];
        input-field = [
          {
            size = "200, 50";
            position = "0, -80";
            monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(CFE6F4)";
            inner_color = "rgb(657DC2)";
            outer_color = "rgb(0D0E15)";
            outline_thickness = 5;
            placeholder_text = "Password...";
            shadow_passes = 2;
          }
        ];
      };
    };
  };
}

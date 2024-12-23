{
  pkgs,
  config,
  osConfig,
  inputs,
  lib,
  ...
}: let
  inherit (config.var) wallpaper;
  inherit (pkgs) system;
  inherit (config.catppuccin) flavor;
  inherit (osConfig.programs.hyprland) enable;

  # The space between windows to line up Hyrpland and Waybar
  windows_space_gap = 15;
in {
  home.packages = with pkgs; [
    hyprshot
    brightnessctl
    wl-clipboard
    wlsunset
  ];

  services.swaync = {
    inherit enable;
    style = let
      theme = builtins.fetchurl {
        url = "https://github.com/catppuccin/swaync/releases/download/v0.2.3/${flavor}.css";
        sha256 = "1xr1wkg4zb467b35xhsfqiwhimfnn88i3ml5rf173rkm7fyby9qy";
      };
    in
      builtins.readFile "${theme}";
  };

  stylix.targets.rofi.enable = false;
  catppuccin.rofi.enable = true;
  programs.rofi = {
    inherit enable;
  };

  services.swayosd = {
    inherit enable;
  };

  services.hyprpaper = {
    inherit enable;
    settings = lib.attrsets.optionalAttrs (!config.stylix.targets.hyprpaper.enable) {
      preload = "${wallpaper}";
      wallpaper = ", ${wallpaper}";
    };
  };

  services.hypridle = {
    inherit enable;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 180;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  programs.hyprlock = {
    inherit enable;
    settings = {
      background =
        {
          monitor = "";
          blur_passes = 2;
        }
        // lib.attrsets.optionalAttrs (!config.stylix.targets.hyprlock.enable) {
          path = "${wallpaper}";
        };

      general = {
        hide_cursor = false;
      };

      input-field =
        {
          monitor = "";
          size = "80px, 60px";
          outline_thickness = 3;
          fade_on_empty = false;
          rounding = 15;

          position = "0, -50";
          halign = "center";
          valign = "center";
        }
        // lib.attrsets.optionalAttrs (!config.stylix.targets.hyprlock.enable) {
          outer_color = "$accent";
          check_color = "$accent";

          fail_color = "$red";
          inner_color = "$base";
          font_color = "$text";
        };

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%A, %B %d\")\"";
          color =
            if config.catppuccin.hyprlock.enable
            then "$text"
            else if config.stylix.enable
            then "#${config.lib.stylix.colors.base05}"
            else "#FFFFFF";
          font_size = 24;
          font_family = config.stylix.fonts.monospace.name;
          position = "0, 220";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%-I:%M\")\"";
          color =
            if config.catppuccin.hyprlock.enable
            then "$text"
            else if config.stylix.enable
            then "#${config.lib.stylix.colors.base05}"
            else "#FFFFFF";
          font_size = 96;
          font_family = "${config.stylix.fonts.monospace.name} Extrabold";
          position = "0, 120";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };

  wayland.windowManager.hyprland = {
    inherit enable;
    package = inputs.hyprland.packages.${system}.hyprland;
    plugins = with inputs.hyprland-plugins.packages.${system}; [
      hyprtrails
      csgo-vulkan-fix
      hyprwinwrap
    ];
    settings = {
      "$terminal" = "kitty";
      "$filemanager" = "yazi";
      "$menu" = "rofi -show drun";

     # "monitor" = ",1920x1200@165.00,auto,1";
      "exec-once" = [
        "$terminal"
        "waybar"
        "wlsunset -S 5:30 -s 18:30"
        "swayosd-server"
      ];

      "env" = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,catppuccin-mocha-mauve-cursors"

        # For Qt
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"

        # Nvidia + Wayland
      #  "LIBVA_DRIVER_NAME,nvidia"
      #  "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      general =
        {
          gaps_in = 5;
          gaps_out = windows_space_gap;
          border_size = 2;

          resize_on_border = false;

          allow_tearing = false;

          layout = "dwindle";
        }
        // lib.attrsets.optionalAttrs (!config.stylix.targets.hyprland.enable) {
          "col.active_border" = "$mauve $flamingo 45deg";
          "col.inactive_border" = "$surface0";
        };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow.range = 4;
        shadow.render_power = 3;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "de";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };
      };
      gestures = {
        workspace_swipe = false;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      plugin = {
        hyprtrails = {
          color =
            if config.catppuccin.hyprland.enable
            then "$accent"
            else if config.stylix.targets.hyprland.enable
            then "rgb(${config.lib.stylix.colors.base0E})"
            else null;
        };
        hyprwinwrap = {
          class = "backgroundapp";
        };
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, W, killactive,"
        "$mainMod CTRL, Q, exit,"
        "$mainMod, E, exec, $terminal -e $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, F, fullscreen, 1"
        ", Print, exec, hyprshot -m region"
        "$mainMod, Print, exec, hyprshot -m output"

        "$mainMod, L, exec, hyprlock"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Laptop multimedia keys for volume and LCD brightness
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
      # Requires playerctl
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
    xwayland.enable = true;
  };

  #programs.cava = {
  #  enable = true;
  #  settings = {
  #    general = {
  #      mode = "normal";
  #      framerate = 60;
  #      bars = 0;
  #      bar_width = 2;
  #      bar_spacing = 1;
  #      bar_height = 32;
  #    };
  #    input = {
  #      method = "pipewire";
  #      source = "auto";
  #    };
  #  };
  #};

  programs.waybar = {
    inherit enable;
    style =
      lib.strings.optionalString config.stylix.targets.waybar.enable ''
        @define-color base #${config.lib.stylix.colors.base00};
        @define-color mantle #${config.lib.stylix.colors.base01};
        @define-color surface0 #${config.lib.stylix.colors.base02};
        @define-color surface1 #${config.lib.stylix.colors.base03};
        @define-color surface2 #${config.lib.stylix.colors.base04};
        @define-color text #${config.lib.stylix.colors.base05};
        @define-color rosewater #${config.lib.stylix.colors.base06};
        @define-color lavender #${config.lib.stylix.colors.base07};
        @define-color red #${config.lib.stylix.colors.base08};
        @define-color peach #${config.lib.stylix.colors.base09};
        @define-color yellow #${config.lib.stylix.colors.base0A};
        @define-color green #${config.lib.stylix.colors.base0B};
        @define-color teal #${config.lib.stylix.colors.base0C};
        @define-color blue #${config.lib.stylix.colors.base0D};
        @define-color mauve #${config.lib.stylix.colors.base0E};
        @define-color flamingo #${config.lib.stylix.colors.base0F};
      ''
      + ''
        * {
          color: @text;
          font-family: ${config.stylix.fonts.monospace.name};
          font-weight: bold;
          font-size: 14px;
        }

        window#waybar {
          background-color: rgba(0, 0, 0, 0);
        }

        #waybar > box {
          margin: 10px ${builtins.toString windows_space_gap}px 0px;
          background-color: @base;
          border: 2px solid @mauve;
        }

        #workspaces,
        #window,
        #idle_inhibitor,
        #wireplumber,
        #network,
        #cpu,
        #memory,
        #battery,
        #clock,
        #power-profiles-daemon,
        #tray,
        #waybar > box {
          border-radius: 12px;
        }

        #workspaces * {
          color: @red;
        }

        #window * {
          color: @mauve;
        }

        #clock {
          color: @peach;
        }

        #idle_inhibitor {
          color: @yellow;
        }

        #wireplumber {
          color: @green;
        }

        #network {
          color: @teal;
        }

        #power-profiles-daemon {
          color: @blue;
        }

        #battery {
          color: @lavender;
        }

        #tray {
          color: @text;
        }

        #idle_inhibitor,
        #wireplumber,
        #network,
        #cpu,
        #memory,
        #battery,
        #clock,
        #power-profiles-daemon,
        #tray {
          padding: 0 5px;
        }
      '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 4;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "idle_inhibitor"
          "wireplumber"
          "network"
          (lib.strings.optionalString osConfig.services.power-profiles-daemon.enable "power-profiles-daemon") # Only enable power-profiles-daemon in waybar if it's enabled in system config
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{name}: {icon}";
          format-icons = {
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
        };

        #cava = {
        #  cava_config = "$HOME/.config/cava/config";
        #  framerate = 60;
        #  bars = 16;
        #  method = "pipewire";
        #  format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        #  bar_delimiter = 0;
        #};

        idle_inhibitor = {
          format = "Idle: {icon} ";
          format-icons = {
            "deactivated" = "";
            "activated" = "";
          };
        };

        wireplumber = {
          format = "Volume: {icon}  {volume}% ";
          format-icons = ["" "" ""];
          format-muted = "Muted ";
        };

        clock = {
          format = "  {:%H:%M}";
        };

        network = {
          format = "  {essid} 󰓅 {signalStrength}";
        };

        power-profiles-daemon = {
          format = "Profile: {icon} ";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };

        battery = {
          format-icons = ["" "" "" "" ""];
          format = "{icon}  {capacity}%";
        };
      };
    };
  };
}

{
  pkgs,
  config,
  inputs,
  system,
  ...
}: let
  hyprland = inputs.hyprland.packages.${system}.hyprland;
in {
  stylix.targets.hyprland.hyprpaper.enable = false;
  wayland.windowManager.hyprland = {
    package = hyprland;
    plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [
      hyprexpo
      # This plugin is broken... :(
      # hyprbars
    ];
    settings = {
      bind = (
        # Workspace keybind
        # $mod + {1..10} to workspace {1..10}
        # $mod + shift + {1..10} to move to workspace {1..10}
        builtins.concatLists (builtins.genList (x: let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "SUPER, ${ws}, workspace, ${toString (x + 1)}"
            "SUPER SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ])
          10)
      );
    };
    extraConfig =
      ''
        monitor=eDP-1,preferred,1
        monitor=HDMI-A-1,preferred,auto,1,mirror,eDP-1
        $touchpad_enable = true
        #exec=ags-desktop
        exec-once=${pkgs.swww}/bin/swww-daemon
        #exec-once=${../../../wallpaper-slideshow.nu} -w ${./wallpapers} -i 30sec
        device {
          #name = elan-touchpad
          enabled = $touchpad_enable
        }
        cursor {
          inactive_timeout = 30
        }
        general {
          resize_on_border = yes
        }
        misc {
          disable_hyprland_logo = true
          disable_splash_rendering = true
          middle_click_paste = false
        }
        $mod = SUPER
        bind = $mod, A, hyprexpo:expo, toggle

        input {
            kb_layout = de
            touchpad {
                natural_scroll = yes
                tap-to-click = true
                disable_while_typing = false
            }
        }
        decoration {
            rounding = 10
            blur {
                enabled = true
                size = 1
                passes = 5
            }
        }
        gestures {
            workspace_swipe = yes
            workspace_swipe_min_speed_to_force = 10
            workspace_swipe_cancel_ratio = 0.3
        }
        
        animations {
          enabled = true
          bezier = easeout, 0,0,.50,1
          bezier = easein, 0,0,1,1
          bezier = easeinout, 1,0,0,1
          bezier = easeInOutCubic, 0.65, 0, 0.35, 1

          animation = layers, 1, 4, easeinout, slide top

          animation = windowsIn, 1, 4, easeinout
          animation = windowsOut, 1, 4, easeinout
          animation = windowsMove, 1, 1, easeInOutCubic

          animation = fadeIn, 1, 4, easeout
          animation = fadeOut, 1, 4, easeout

          animation = workspaces, 1, 2, easein
        }
        windowrulev2=opaque,title:(.*)( - YouTube — Mozilla Firefox)$
        windowrulev2=noanim,title:(woomer)$
        # Disable animation for start menu and bar
        # Animate dashboard
        layerrule = animation slide top, (bar|dashboard|start-menu)$
        # Add blur to the dashboard
        layerrule = blur, dashboard
        # Make sure the dashboard appears behind the bar
        layerrule = order 1, bar
        layerrule = order 2, start-menu
        layerrule = order 3, dashboard
        ${
          if (config.programs.vesktop.vencord.settings.plugins."WebRichPresence (arRPC)".enabled or false)
          then "exec-once=${pkgs.arrpc}/bin/arrpc"
          else ""
        }
        #exec-once=${pkgs.dex}/bin/dex -a

        binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
        bindl=, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-
        bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

        binde=, XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl s +5%
        binde=, XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl s 5%-
        
        #bind=, XF86Sleep, exec, ${pkgs.systemd}/bin/systemctl suspend
        #bind=, XF86AudioStop, exec, ${pkgs.playerctl}/bin/playerctl stop
        #bind=, XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause
        #bind=, XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous
        #bind=, XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next

        bind=CTRL ALT, left, workspace, e-1
        bind=CTRL ALT, right, workspace, e+1
        bind=CTRL ALT SHIFT, left, movetoworkspace, e-1
        bind=CTRL ALT SHIFT, right, movetoworkspace, e+1

        bind = SUPER_SHIFT, PRINT, exec, hyprshot -m window -o ~/Pictures/screenshots/
        bind = $mod, PRINT, exec, hyprshot -m output -o ~/Pictures/screenshots/
        bind = , PRINT, exec, hyprshot -m region -o ~/Pictures/screenshots/

        bind = $mainMod, E, exec, kitty -e zsh -c 'tmp="$(mktemp -t "yazi-cwd.XXXXX")"; yazi "$@" --cwd-file="$tmp"; if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then; cd -- "$cwd"; fi; rm -f -- "$tmp"; exec $SHELL'
        # bind = SUPER_SHIFT, ? , exec, kitty -e zsh -c 'btop
        bind = $mainMod, BACKSPACE, exec, lxtask

       bind = SUPER_SHIFT, M, exec, ~/scripts/monitor-switch-rofi
       bind = SUPER_SHIFT, J, exec, ~/scripts/jdownloader

       bind = $mainMod, V, exec, ~/scripts/videotool
       bind = $mainMod, X, exec, kitty -e zsh -c "~/scripts/executer"
       bind = $mainMod, O, exec, ~/scripts/screenshot-ocr

       bind = SUPER_SHIFT, W, exec, ~/scripts/wallpaper
       bind = $mainMod, W, exec, ~/scripts/wallpaper-random

       bind = SUPERSHIFT, BACKSPACE, exec, ~/scripts/powerswitch-rofi
       #bind = $mainMod, F, exec, natilus
       bind = $mainMod, B, exec, brave
       #bind = SUPER_SHIFT, L, exec, hyprlock
       #bind = $mainMod, tab, togglefloating,   
       bind = $mainMod, SPACE, exec, rofi -show combi 
       bind = SUPER_SHIFT, SPACE, exec, wofi --show drun 

      #bindr=$mod, SUPER_L, exec, ${inputs.ags.packages.${system}.default}/bin/ags toggle start-menu
      #bind=$mod, D, exec, ${inputs.ags.packages.${system}.default}/bin/ags toggle dashboard
        
        ${
          if config.programs.kitty.enable
          then "bind=$mod, T, exec, ${pkgs.kitty}/bin/kitty"
          else ""
        }
        bind=$mod, F, fullscreen
        bind=$mod, R, submap, rearrange
        bind=$mod SHIFT, F, pseudo
        # Close app
        bind=$mod, Q, killactive

        # Move focus keybinds
        bind=$mod, left, movefocus, l
        bind=$mod, right, movefocus, r
        bind=$mod, up, movefocus, u
        bind=$mod, down, movefocus, d
        bind=$mod, U, focusurgentorlast

        # Mouse bindings
        bindm=$mod,mouse:272,movewindow
        bindm=$mod,mouse:273,resizewindow
        # Rearrange mode keybinds
        submap=rearrange
            $rearrangeMod=SHIFT
            bind=, a, movefocus, l
            bind=, d, movefocus, r
            bind=, w, movefocus, u
            bind=, s, movefocus, d

            binde=, right, resizeactive, -10 0
            binde=, left, resizeactive, 10 0
            binde=, down, resizeactive, 0 -10
            binde=, up, resizeactive, 0 10

            bind=, Tab, cyclenext
            bind=$rearrangeMod, Tab, swapnext

            bind=$rearrangeMod, right,movewindow, r
            bind=$rearrangeMod, left, movewindow, l
            bind=$rearrangeMod, down, movewindow, d
            bind=$rearrangeMod, up,   movewindow, u
            bind=, f,      togglefloating
            bind=, c,      centerwindow
            # Exit rearrange mode
            bind=, Escape, submap         , reset
        submap=reset
        plugin {
          hyprexpo {
              columns = 3
              gap_size = 5
              bg_col = rgb(${config.lib.stylix.colors.base00})
              workspace_method = center current # [center/first] [workspace] e.g. first 1 or center m+1

              enable_gesture = true # laptop touchpad
              gesture_fingers = 3  # 3 or 4
              gesture_distance = 300 # how far is the "max"
              gesture_positive = false # positive = swipe down. Negative = swipe up.
          }
        }
      '';
  };
}

{ config, pkgs, lib, ... }:

let
  swayConfig = ''
    # Set the modifier key to the "Super" key
    set $mod Mod4
    set $terminal kitty
    set $browser brave
    set $fileManager nautilus
    set $menu rofi -show drun

    # Keybindings from Hyprland
    bindsym $mod+Return exec $terminal
    bindsym $mod+q kill

    bindsym Mod4+Shift+BackSpace exec ~/scripts/powerswitch-rofi
    bindsym $mod+f exec $fileManager
    bindsym $mod+b exec $browser
    bindsym Mod4+Shift+l exec swaylock

    bindsym $mod+Tab floating toggle
    bindsym $mod+space exec $menu
    bindsym Mod4+Shift+space exec rofi -show drun

    # Pseudo tiling (no native Wayland equivalent, keeping a placeholder)
    # ALT+P pseudo # dwindle

    bindsym $mod+p splith
    bindsym $mod+e exec $terminal -e zsh -c 'tmp="$(mktemp -t "yazi-cwd.XXXXX")"; yazi "$@" --cwd-file="$tmp"; if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then; cd -- "$cwd"; fi; rm -f -- "$tmp"; exec $SHELL'

    bindsym $mod+BackSpace exec lxtask

    bindsym Mod4+Shift+m exec ~/scripts/monitor-switch-sway
    bindsym Mod4+Shift+j exec ~/scripts/jdownloader

    bindsym $mod+v exec ~/scripts/videotool
    bindsym $mod+x exec $terminal -e zsh -c "~/scripts/executer"
    bindsym $mod+o exec ~/scripts/screenshot-ocr

    bindsym Mod4+Shift+e exec ~/scripts/sunset-4k

    bindsym Mod4+Shift+h exec brightnessctl -d intel_backlight set 1
    bindsym Mod4+Shift+i exec brightnessctl -d intel_backlight set 70%

    bindsym Mod4+Shift+w exec ~/scripts/wallpaper
    bindsym $mod+w exec ~/scripts/wallpaper-random
 
    # Screenshot Bindings
    # Screenshot a window
    bindsym Print exec grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.type? == "con" and .focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" ~/Pictures/screenshots/window-$(date +'%Y-%m-%d_%H-%M-%S').png

    # Screenshot a monitor
    bindsym Mod4+Shift+Print exec grim -o $(swaymsg -t get_outputs -r | jq -r '.[] | select(.focused) | .name') ~/Pictures/screenshots/monitor-$(date +'%Y-%m-%d_%H-%M-%S').png

    # Screenshot a region
    bindsym $mod+Print exec grim -g "$(slurp)" ~/Pictures/screenshots/region-$(date +'%Y-%m-%d_%H-%M-%S').png


# Define workspaces
    set $workspace1 "1: PC 电脑"
    set $workspace2 "2: Browser 火"
    set $workspace3 "3: Social 兑"
    set $workspace4 "4: Video  电视"
    set $workspace5 "5: Games 玩家"
    set $workspace6 "6: Work  勞 "

    # Keybindings for workspace switching
    bindsym $mod+1 workspace $workspace1
    bindsym $mod+2 workspace $workspace2
    bindsym $mod+3 workspace $workspace3
    bindsym $mod+4 workspace $workspace4
    bindsym $mod+5 workspace $workspace5
    bindsym $mod+6 workspace $workspace6

    # Assign applications to workspaces
    assign [app_id="nautilus"] $workspace1
    assign [app_id="brave"] $workspace2

    assign [app_id="discord"] $workspace3
    assign [app_id="telegram-desktop"] $workspace3
    assign [app_id="thunderbird"] $workspace3

    assign [app_id="mpv"] $workspace4
    assign [app_id="steam"] $workspace5
    assign [app_id="lutris"] $workspace5
    assign [app_id="heroic"] $workspace5
    assign [app_id="dolphin-emu"] $workspace5
    assign [app_id="cemu"] $workspace5
    assign [app_id="ryujinx"] $workspace5

    # Remove window borders
    for_window [app_id="^.*"] border pixel 0


    '';
in
{
  programs.sway = {
    enable = true;
    extraSessionCommands = swayConfig;
    configFile = "sway/config"; # File path within ~/.config
  };

  home.packages = with pkgs; [
    kitty           # Terminal emulator
    brave           # Browser
    rofi            # Application launcher
    swaylock        # Screen locker
    brightnessctl   # Brightness control
    lxtask          # Task manager
    wl-clipboard    # Clipboard utility
  ];

  home.file.".config/sway/config".text = swayConfig;
}


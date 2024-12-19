{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-left = 5;
        margin-right = 5;
        margin-top = 5;
        spacing = 5;
        height = 32;
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{name}";
          format-active = "{icon} {name}";
          format-inactive = "{icon} {name}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "default" = " ";
          };
          persistent-workspaces = {};
        };

        "custom/launcher" = {
          "format" = "❄️ ";
          "on-click" = "exec wofi --show run";
          "on-click-middle" = "exec rofi -show drun";
          "on-click-right" = "exec rofi -show run";
          "tooltip" = false;
        };

        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = " ";
            unlocked = " ";
          };
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };

        tray = {
          spacing = 10;
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%b %d %Y}";
        };
        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C";
        };

        backlight = {
          "device" = "intel_backlight";
          "rotate" = 0;
          "format" = "{icon}";
          "format-icons" = [" " " " " " " " " " " " " " " " " "];
          "on-scroll-up" = "brightnessctl --device intel_backlight set 5%+";
          "on-scroll-down" = "brightnessctl --device intel_backlight --min-value=1000 set 5%-";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "{icon} {capacity}%";
          format-plugged = "{icon} {capacity}%";
          format-discharging = "{icon} {capacity}%";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        network = {
          format-wifi = " ";
          tooltip-format = "{essid}";
          format-ethernet = "󰈀 ";
          format-disconnected = "⚠ ";
        };

        pulseaudio = {
          format = "{icon}";
          format-muted = "󰖁 ";
          format-icons = {
            default = [" " " " "󰕾 "];
          };
	  on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-scroll-up = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
 on-scroll-down = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-";
          on-click-right = "exec pavucontrol";
          tooltip-format = "{volume}%";
        };
      };
    };

  };
}


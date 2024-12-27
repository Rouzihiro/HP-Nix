{ config, pkgs, lib, inputs, ... }:



{
  home.packages = with pkgs; [
    hyprlock
  ];



  programs.hyprlock = {
    enable = true;
    settings = {
      general = [
        {
          disable_loading_bar = true;
          hide_cursor = true;
          grace = 1;
        }
      ];
      background = [
        {
          path = "screenshot";
          blur_passes = 1;
          blur_size = 3;
          vibrancy = 0.2;
          vibrancy_darkness = 0.2;
        }
      ];
      input-field = [
        {
          monitor = "";
          size = "400, 60";
          outline_thickness = "2";
          dots_size = "0.4";
          dots_spacing = "0.2";
          dots_center = true;
          outer_color = "rgba(40,40,40, 0.1)";
          inner_color = "rgba(137, 180, 250, 0.1)"; # no fill
          fade_on_empty = true;
          placeholder_text = "Enter Password";
          hide_input = false;
          position = "0, 500";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}

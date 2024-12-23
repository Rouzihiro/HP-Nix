{ config, pkgs, ... }:

let
  # Generate the Wofi configuration file
  wofiConfig = pkgs.writeText "wofi-config" ''
    [main]
    border_width=2
    border_radius=10
    opacity=90
    padding=10
    columns=3
    background="#2E3440"
    foreground="#ECEFF4"
    highlight="#88C0D0"
    highlight_background="#3B4252"
    selected="#BF616A"
    selected_background="#4C566A"
    font="Noto Sans 14"
    lines=10
    line_height=40
    icon_theme="Papirus-Dark"
    icon_size=24
    shadow=true

    [bindings]
    mod=Super
    enter=run
    escape=exit
  '';
in
{
  # Link the Wofi configuration file to the correct location
  environment.etc."wofi/config".source = wofiConfig;

}


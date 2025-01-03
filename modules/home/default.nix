{ config, pkgs, ... }:

{
  imports = [
    ./android
    ./cli
    ./gui
    ./misc
    ./tui
    ./virtualisation
    ./wm
  ];
}

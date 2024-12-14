{ pkgs, lib, config, ... }:
{

services.xserver.windowManager.qtile = {
  enable = true;
  configFile = ./qtile/config.py; # replace this with actual path
  extraPackages = python3Packages: with python3Packages; [ # this only if you want to use qtile extras
    qtile-extras
  ];
};  

}



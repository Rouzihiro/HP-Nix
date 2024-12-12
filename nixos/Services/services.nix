{ config, pkgs, ... }:

{

  #Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #services
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  #services.nfs.client.enable = true;

  services.dbus.enable = true;
  services.udev.enable = true;

}

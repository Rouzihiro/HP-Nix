{ config, pkgs, ... }:

{
  # System auto-upgrade
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-24.05";
  };
}

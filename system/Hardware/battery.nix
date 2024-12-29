{ pkgs, drivers, timezone, locale, host, ... }:

let host = "HP";

in {

  networking.hostName = "HP"; # Set the hostname for your system

  # Laptop battery settings
  services = {
    thermald.enable = if host == "HP" then true else false;
    tlp = {
      enable = if host == "HP" then true else false;
      settings = {
        TLP_DEFAULT_MODE = "BAT";
        TLP_PERSISTENT_DEFAULT = 1;
      };
    };
  };

}

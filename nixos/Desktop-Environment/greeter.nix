{ config, pkgs, ... }:
{

  services.displayManager = {
  enable = true;
  displayManager = pkgs.greetd;
};

services.displayManager.greetd = {
  autologinUser = "rey";
  # Optionally, specify a greeter like agreety or gtkgreet (default is agreety)
  # greeter = pkgs.agreety;  # or pkgs.gtkgreet for a graphical greeter
  greeter = pkgs.gtkgreet;  # Use the GTK graphical greeter
};


  }


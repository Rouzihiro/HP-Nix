{ config, pkgs, ... }:

{

  services.xserver.enable =  true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasma";

#    enable = true;
#    layout = "de";
#    xkb.variant = "";
#    windowManager.i3.enable = true;  # Enable i3 window manager
#  };

 # services.displayManager = {
   # sessionPackages = [ pkgs.plasma ];  # Include i3 in session packages
  #  autoLogin.enable = true;
  #  autoLogin.user = "rey";
 # };
  }

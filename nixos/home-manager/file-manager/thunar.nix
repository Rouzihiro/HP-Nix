{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xfce.thunar-volman
    gvfs
    polkit
  ];

  # Ensure udisks2 service is enabled
  services.udisks2.enable = true;

  # Add the polkit rule file
  environment.etc."polkit-1/rules.d/50-thunar-mount.rules".text = ''
    polkit.addRule(function(action, subject) {
      if ((action.id == "org.freedesktop.udisks2.filesystem-mount" ||
           action.id == "org.freedesktop.udisks2.filesystem-unmount-others" ||
           action.id == "org.freedesktop.udisks2.encrypted-unlock" ||
           action.id == "org.freedesktop.udisks2.eject-media" ||
           action.id == "org.freedesktop.udisks2.power-off-drive") &&
          subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';

}

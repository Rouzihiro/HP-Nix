{ config, pkgs, ... }:

{
  # Install Nautilus and necessary components
  environment.systemPackages = with pkgs; [
    nautilus
    #gvfs
    #samba
    #smbclient
  ];

  # Enable udisks2 service for automatic mounting of devices
  services.udisks2.enable = true;

  # Enable polkit for mounting/unmounting shares without needing root access
  environment.etc."polkit-1/rules.d/50-nautilus-mount.rules".text = ''
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

  # Make sure nautilus is started at boot (if you want it to run as a background process)
  systemd.user.services.nautilus = {
    enable = true;
    description = "Start Nautilus as a background service";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.nautilus}/bin/nautilus --no-desktop --browser";
      Restart = "always";
    };
  };
}


{ pkgs, lib, ...}: {
  programs.ssh = {
    enable = true;
    #addKeysToAgent = "yes";

    matchBlocks = {
      "Git" = {
        host = "github.com";
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/HP-Nixo.pub"
        ];
      };
    };
  };

#  services.ssh-agent = {
#    enable = lib.modules.mkIf pkgs.stdenv.isLinux true;
#  };


}

{ config, pkgs, ... }: {

programs.wayfire = {
  enable = true;
  plugins = with pkgs.wayfirePlugins; [
    wcm
    wf-shell
    wayfire-plugins-extra
  ];
};

  environment.variables = {
    WAYFIRE_PLUGIN_PATH = "/run/current-system/sw/lib/wayfire";
    WAYFIRE_PLUGIN_XML_PATH = "/run/current-system/sw/share/wayfire/metadata";
  };

}

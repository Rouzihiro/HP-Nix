{
  config,
  pkgs,
  lib,
  ...
}: {
  programs = {
    
    yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "ya";
      keymap = {
        manager.prepend_keymap = [
          {
            run = ''shell 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list' --confirm'';
            on = ["y"];
          }
          {
            run = ''shell "$SHELL" --block --confirm'';
            on = ["w"];
          }
          {
            run = "plugin --sync max-preview";
            on = ["T"];
          }
          {
            run = "tasks_show";
            on = ["W"];
          }
        ];
        tasks.prepend_keymap = [
          {
            run = "close";
            on = ["W"];
          }
        ];
      };
      plugins = {
        max-preview = "${pkgs.yazi-plugins}/share/max-preview.yazi";
      };
      settings = {
        manager = {
          ratio = [1 3 3];
          sort_by = "natural";
          show_hidden = true;
        };
      };
      theme = {
        status.separator_open = "";
        status.separator_close = "";
      };
    };
  };
}

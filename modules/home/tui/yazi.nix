{ config, pkgs, ... }:

let yaziPackage = pkgs.yazi;
in {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      manager = {
        layout = [ 1 4 3 ];
        sort_by = "natural";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };

      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        tab_size = 1;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        ueberzug_scale = 1;
        ueberzug_offset = [ 0 0 0 0 ];
      };

      keymap = {
        manager.prepend_keymap = [{
          on = [ "l" ];
          run = "plugin --sync smart-enter";
          desc = "Enter the child directory, or open the file";
        }];
      };

      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;
      };
    };
  };

  # Optionally, you can enable the stylix integration if needed
  # programs.stylix.targets.yazi.enable = true;
}

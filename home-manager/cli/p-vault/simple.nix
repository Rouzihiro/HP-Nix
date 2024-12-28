services.porn-vault = {
  enable = true;
  autoStart = true;
  openFirewall = true;
  settings = {
    import = {
      videos = [
        {
          path = "~/Videos/xxx/";
          include = [ ];
          exclude = [ ];
          extensions = [
            ".mp4"
            ".mov"
            ".webm"
          ];
          enable = true;
        }
      ];
    };
  };
};

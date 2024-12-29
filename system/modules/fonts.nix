{ pkgs, config, host, username, options, lib, inputs, system, ... }: {
  fonts.packages = with pkgs; [
    noto-fonts
    fira-code
    noto-fonts-cjk-sans
    jetbrains-mono
    material-icons
    font-awesome
    terminus_font
    nerd-fonts.monaspace
    nerd-fonts.jetbrains-mono

  ];
}

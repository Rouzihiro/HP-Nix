{
  pkgs,
  drivers,
  timezone,
  locale,
  host,
  ...
}:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    nerd-fonts.fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    iosevka
    nerd-fonts.jetbrains-mono
    monaspace
    cascadia-code
  ];

}

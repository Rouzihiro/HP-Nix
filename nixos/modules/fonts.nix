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
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    iosevka
    jetbrains-mono
    monaspace
    cascadia-code
  ];

}

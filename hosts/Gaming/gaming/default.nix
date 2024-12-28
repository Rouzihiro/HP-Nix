{ config, pkgs, ... }:

{
  imports = [
    ./games.nix
    ./emulators.nix
    #./SteamTinkerLaunch.nix
    #./bubblewrap.nix
    ./experimental.nix
  ];

}

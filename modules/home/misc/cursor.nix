{ pkgs, lib, ... }:

{
  home = {
    pointerCursor = {
      package = pkgs.capitaine-cursors;
      name = lib.mkDefault "Capitaine";
      size = lib.mkDefault 24;
    };
  };
}


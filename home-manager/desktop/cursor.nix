{ pkgs, ... }:

{
  home = {
    pointerCursor = {
      package = pkgs.capitaine-cursors;
      name = "Capitaine";
      size = 24;
    };
  };
}


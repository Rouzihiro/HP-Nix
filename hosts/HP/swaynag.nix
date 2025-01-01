{ ... }: let

  color = import ./../../library/color.nix {};
  profile = import ./../../library/profile.nix {};

in {
  home-manager = {
    users.${profile.name} = {
      wayland = {
        windowManager = {
          sway = {
            swaynag = {
              enable = true;
              settings = {
                "<config>" = {
                  edge = "top";
                  font = "Fira Sans 10";
                  background = color.background;
                  message-padding = 5;
                };
              };
            };
          };
        };
      };
    };
  };
}

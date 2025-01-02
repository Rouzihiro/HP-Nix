{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    stylix.url = "github:danth/stylix";
    
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

      fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };

    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";

    # hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    # deactivated again since battery-state isnt shown correctly

    yt-x.url = "github:Benexl/yt-x";

    zen-browser.url = "github:Gurjaka/zen-browser-nix";

    qtile-flake = {
      url = "github:qtile/qtile";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qtile-extras-flake = {
      url = "github:elparaguayo/qtile-extras";
      flake = false;
    };


    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      hyprland-qtutils,
      spicetify-nix,
      ...
    }@inputs:
    let
      system-settings = {
        host = "HP";
        user = "rey"; 
        drivers = "intel"; # select drivers amd/nvidia/intel
        timezone = "Europe/Berlin";
        locale = "de_DE.UTF-8"; 
        shell = "zsh"; # zsh/fish/bash
        editor = "nvim";
        theme = "nord"; # select theme currently available nord/everforest
        GitUser = "Rouzihiro";
        GitMail = "ryossj@gmail.com";
      };

      propagated-args = system-settings // {
        inherit inputs;
      };
    in
    {
      nixosConfigurations = {
        # Host config
        "${system-settings.host}" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = propagated-args;
          modules = [
            ./hosts/${system-settings.host}/configuration.nix
            ./overlays.nix
            inputs.stylix.nixosModules.stylix
            #{nixpkgs.overlays = [inputs.hyprpanel.overlay];}
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                extraSpecialArgs = propagated-args;
                backupFileExtension = "backup";  
                users = {
                  "${system-settings.user}" = import ./hosts/${system-settings.host}/home.nix;                 };

                sharedModules = with inputs; [
                  spicetify-nix.homeManagerModules.default
                  nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };
      };
    };
}


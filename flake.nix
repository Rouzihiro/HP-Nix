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

    #hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    # deactivated again since battery-state isnt shown correctly

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
      spicetify-nix,
      ...
    }@inputs:
    let
      system-settings = {
        host = builtins.readFile "/etc/hostname" // "HP"; 
        user = "rey"; # select user
        drivers = "intel"; # select drivers amd/nvidia/intel
        timezone = "Europe/Berlin"; # select timezone
        locale = "de_DE.UTF-8"; # select locale
        shell = "zsh"; # zsh/fish/bash
        theme = "nord"; # select theme currently available nord/everforest
      };

      propagated-args = system-settings // {
        inherit inputs;
      };
    in
    {
      nixosConfigurations = {
        # Host config
        "${system-settings.host}" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux"; # System architecture
          specialArgs = propagated-args;
          modules = [
            ./hosts/${system-settings.host}/configuration.nix
            inputs.stylix.nixosModules.stylix
            #{nixpkgs.overlays = [inputs.hyprpanel.overlay];}
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                extraSpecialArgs = propagated-args;

                # Enable Home Manager backup functionality
                backupFileExtension = "backup";  # Set file extension for backup files

                users = {
                  "${system-settings.user}" = import ./hosts/${system-settings.host}/home.nix; # Make sure home.nix is correct
                };

                # Add any shared modules you need
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


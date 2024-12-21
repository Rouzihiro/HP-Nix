{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    nixosConfigurations = {
      HP = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Adjust for your system architecture
        modules = [
          ./hosts/HP/configuration.nix # Path to your NixOS configuration
          #home-manager.nixosModules.home-manager # Including home-manager module
        ];
        specialArgs = { inherit self; };
      };
    };

    homeConfigurations = {
      rey = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux"; # Adjusted for Linux
        homeDirectory = "/home/rey"; # Adjusted for your username
        username = "rey"; # Adjusted for your username
        configuration.imports = [ ./hosts/HP/home.nix ]; # Adjusted path
      };
    };
  };
}


{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      nixvim,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {

      nixpkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      nixosConfigurations = {
        HP = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/HP/configuration.nix
            inputs.stylix.nixosModules.stylix
          ];
        };
      };

      homeConfigurations = {
        rey = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          modules = [
            ./hosts/HP/home.nix
            nixvim.homeManagerModules.nixvim
          ];
        };
      };
    };
}

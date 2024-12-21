{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, stylix, nixpkgs, home-manager, ... }: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    nixosConfigurations = {
      HP = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/HP/configuration.nix
          stylix.nixosModules.stylix
        ];
        
       specialArgs = { inherit self; };
    };

    homeConfigurations = {
      rey = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux"; 
        homeDirectory = "/home/rey"; 
        username = "rey"; 
        configuration.imports = [ ./hosts/HP/home.nix ];
      };
    };
  };
};
}

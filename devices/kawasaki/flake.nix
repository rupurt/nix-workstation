{
  description = "Home Manager configuration of alex";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:pta2002/nixvim";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations = {
      "alex" = home-manager.lib.homeManagerConfiguration {
        # TODO:
        # - What does this actually do?
        # - Why do all of the examples use x86 legacy packages?
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [ 
          inputs.nixvim.homeManagerModules.nixvim
          ../../home
          ../../home/linux.nix
          {
            home.username = "alex";
            home.homeDirectory = "/home/alex";
          }
        ];
      };
    };
  };
}

{
  description = "Home Manager configuration for alex";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixvim = {
      url = "github:pta2002/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = {
    nixpkgs-unstable,
    flake-utils,
    home-manager,
    nixvim,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    outputs = flake-utils.lib.eachSystem systems (system: let
      pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      homeConfigurations = {
        "alex" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;

          modules = [
            nixvim.homeManagerModules.nixvim
            ./home
          ];
        };
      };
    in {
      packages = {
        homeConfigurations = homeConfigurations;
        default = home-manager.defaultPackage.${system};
      };
    });
  in outputs;
}

{
  description = "Home Manager configuration for alex";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:pta2002/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    home-manager,
    nixvim,
    neovim-nightly-overlay,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    outputs = flake-utils.lib.eachSystem systems (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          neovim-nightly-overlay.overlay
        ];
      };
      homeConfigurations = {
        alex = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;

          modules = [
            nixvim.homeManagerModules.nixvim
            ./home
          ];
        };
      };
    in {
      # packages exported by the flake
      packages = {
        homeConfigurations = homeConfigurations;
        default = home-manager.defaultPackage.${system};
      };

      # nix fmt
      formatter = pkgs.alejandra;
    });
  in
    outputs;
}

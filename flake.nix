{
  description = "Home Manager configuration for alex";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:pta2002/nixvim";
  };

  # outputs = { nixpkgs, home-manager, ... }@inputs: {
  #   defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
  #
  #   homeConfigurations = {
  #     "alex" = home-manager.lib.homeManagerConfiguration {
  #       # TODO:
  #       # - What does this actually do?
  #       # - Why do all of the examples use x86 legacy packages?
  #       pkgs = nixpkgs.legacyPackages.x86_64-linux;
  #
  #       modules = [ 
  #         inputs.nixvim.homeManagerModules.nixvim
  #         ../../home
  #         ../../home/linux.nix
  #         ../../home/neovim/options/linux.nix
  #         {
  #           home.username = "alex";
  #           home.homeDirectory = "/home/alex";
  #         }
  #       ];
  #     };
  #   };
  # };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      imports = [
        ./devices
        # ./packages
        # ./templates
      ];
    };
}


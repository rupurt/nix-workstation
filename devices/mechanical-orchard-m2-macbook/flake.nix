{
  description = "Home Manager configuration of alex";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:pta2002/nixvim";
    zls.url = "github:zigtools/zls";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
    zls,
    ...
  }: let
    system = "aarch64-darwin";
    pkgs = import nixpkgs { inherit system; };
  in {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

    homeConfigurations = {
      "alex" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;

        modules = [ 
          nixvim.homeManagerModules.nixvim
          ../../home
          ../../home/darwin.nix
          # home-manager.darwinModules.home-manager
          {
            home.username = "alex";
            home.homeDirectory = "/Users/alex";

            # homebrew.casks = [
            #   "amazon-workspaces"
            #   "tandem"
            #   "dbeaver-community"
            #   "dbvisualizer"
            # ];
          }
        ];
        extraSpecialArgs = { inherit zls; };
      };
    };
  };
}

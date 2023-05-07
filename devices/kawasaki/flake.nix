{
  description = "Home Manager configuration of alex";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    defaultPackage.${system} = home-manager.defaultPackage.${system};

    homeConfigurations = {
      "alex" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;

        modules = [ 
          nixvim.homeManagerModules.nixvim
          ../../home
          ../../home/linux.nix
          ../../home/neovim/options/linux.nix
          {
            home.username = "alex";
            home.homeDirectory = "/home/alex";
          }
        ];
        extraSpecialArgs = { inherit zls; };
      };
    };
  };
}

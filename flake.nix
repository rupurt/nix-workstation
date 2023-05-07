{
  description = "Home Manager configuration of alex";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-flake.url = "github:srid/nixos-flake";
    nixvim.url = "github:pta2002/nixvim";
  };

  # outputs = {
  #   self,
  #   home-manager,
  #   flake-utils,
  #   nixpkgs,
  #   ...
  # }@inputs: {
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
  #         ../home-shared.nix
  #         ../home-shared-linux.nix
  #         {
  #           home.username = "alex";
  #           home.homeDirectory = "/home/alex";
  #         }
  #       ];
  #     };
  #   };
  # };

  outputs = inputs@{
    self,
    flake-parts,
    nixpkgs,
    nixos-flake,
    nixvim,
    ...
  }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
      imports = [
        nixos-flake.flakeModule
      ];

      flake.homeModules.default = ./home.nix;

      flake.templates.default = {
        description = "A `home-manager` template providing useful tools & settings for Nix-based development";
        path = builtins.path {
          path = ./.;
          filter = path: _:
            !(nixpkgs.lib.hasSuffix "LICENSE" path ||
              nixpkgs.lib.hasSuffix "README.md" path);
        };
      };

      perSystem = { self', pkgs, ... }:
        let
          myUserName = "alex";
        in
        {
          legacyPackages.homeConfigurations.${myUserName} =
            self.nixos-flake.lib.mkHomeConfiguration
              pkgs
              ({ pkgs, ... }: {
                imports = [
                  self.homeModules.default
                  nixvim.homeManagerModules.nixvim
                ];
                home.username = myUserName;
                home.homeDirectory = "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/${myUserName}";
                home.stateVersion = "22.11";
              });

          # Enables 'nix run' to activate.
          apps.default.program = self'.packages.activate-home;

          # Enable 'nix build' to build the home configuration, but without
          # activating.
          packages.default = self'.legacyPackages.homeConfigurations.${myUserName}.activationPackage;
        };
    };
}

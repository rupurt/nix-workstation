{ inputs, ... }:

let inherit (inputs)
  darwin
  home-manager
  nixpkgs;
in
{
  flake = {
    darwinConfigurations = {
      mechanical-orchard-m2-macbook = import ./mechanical-orchard-m2-macbook { inherit darwin home-manager; };
    };
    nixosConfigurations = {
      kawasaki = import ./kawasaki { inherit nixpkgs home-manager; };
    };
  };
}

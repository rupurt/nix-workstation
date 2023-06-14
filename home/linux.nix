{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # shell
    zsh
    # system utils
    gotop
    # docker
    # docker
    # docker-buildx
    # docker-compose
    # api
    iaito
    insomnia
    k3s
  ];
}

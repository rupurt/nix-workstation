{ pkgs, ... }:

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
    insomnia
    k3s
  ];
}

{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # shell
	# zsh doesn't seem to be explicitly needed
    # zsh
    # system utils
    gotop
    # docker
    # docker
    # docker-buildx
    # docker-compose
    # api
    insomnia
  ];
}

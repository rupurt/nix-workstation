{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Alex Kwiatkowski";
    userEmail = "alex+git@fremantle.io";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };

    ignores = [
      # ".venv"
    ];

    aliases = {
      s = "status";
      co = "checkout";
      w = "whatchanged";
      fo = "fetch origin";
      pr = "pull --rebase";
    };
  };
}

{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Alex Kwiatkowski";
    userEmail = "alex+git@fremantle.io";

    ignores = [
      # ".venv"
    ];

    aliases = {
      st = "status";
      co = "checkout";
      w = "whatchanged";
      fo = "fetch origin";
      pr = "pull --rebase";
    };

    difftastic.enable = true;

    extraConfig = {
      init.defaultBranch = "main";
      pager.diff = false;
    };
  };
}

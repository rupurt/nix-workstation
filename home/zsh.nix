{
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      # personal projects
      nh = "cd ~/workspace/rupurt/nix-home";
      elsp = "cd ~/workspace/elixir-lsp/elixir-ls";

      # mechanical-orchard projects
      kmf = "cd ~/workspace/mechanical-orchard/kohls_mainframe";
      kedb2 = "cd ~/workspace/mechanical-orchard/kohls_ecto_db2";
      kdb2ex = "cd ~/workspace/mechanical-orchard/kohls_db2ex";

      # tmux sessions
      muxmf = "tmuxinator start mo-kohls-mainframe";
      muxnh = "tmuxinator start nix-home";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "asdf"
        "docker"
        "docker-compose"
        "fzf"
        "gh"
        "git"
        "grc"
        "kubectl"
        "rsync"
        "sudo"
        "terraform"
        "tmux"
        "tmuxinator"
      ];
    };

    sessionVariables = {
      EDITOR = "nvim";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    # initExtra = ''
    #   source <(gt completion)
    #   export PATH=~/google-cloud-sdk/bin:$PATH
    #   export GCEVM_USERNAME=alex;
    # '';

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.callPackage ./p10k {};
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k;
        file = "config.zsh";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];
  };
}

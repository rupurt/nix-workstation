{ pkgs, ...} : {
  imports = [
    # This loads ./home/neovim/default.nix - neovim configured for Haskell dev, and other things.
    #./home/neovim
    # Add more of your home-manager modules here.
    ./home/tmux.nix
    ./home/neovim.nix
    ./home/zsh.nix
    ./home/git.nix
    ./home/direnv.nix
  ];

  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    # system utils
    htop
    bat
    tree
    qemu
    # network utils
    wireguard-tools
    tailscale
    whois
    # general utils
    silver-searcher
    jq
    jql
    fzf
    asciinema-agg
    grc
    hey
    hurl
    rsync
    watchman
    # development utils
    tmuxinator
    git
    gh
    gnumake
    cmake
    cachix
    difftastic
    protobuf
    packer
    wasmtime
    upx
    upterm
    #vscode
    hugo
    prometheus
    grafana
    docker
    docker-buildx
    docker-compose
    # k8s
    kubectl
    kubernetes-helm
    kubectx
    krew
    k9s
    skaffold
    # cloud
    awscli2
    eksctl
    (google-cloud-sdk.withExtraComponents ([
      google-cloud-sdk.components.gke-gcloud-auth-plugin
    ]))
    terraform
    terraform-ls
    pulumi
    flyctl
    # load testing
    k6
    # kafka
    kcat
    kafkactl
    #redpanda
    # sql
    usql
    duckdb
    octosql
    sqlite
    sqlite-utils
    # redis
    redis
    # languages
    jdk
    gopls
    rust-analyzer
    zls

    # nodePackages.typescript-language-server
    # nodePackages.vscode-langservers-extracted
    # nodePackages.eslint
    # nodePackages.prettier

    # customNodePackages."@ansible/ansible-language-server"
    # customNodePackages."@withgraphite/graphite-cli"

    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  fonts.fontconfig.enable = true;

  # Programs natively supported by home-manager.
  programs = {
  ## on macOS, you probably don't need this
  #bash = {
  #  enable = true;
  #  initExtra = ''
  #    # Make Nix and home-manager installed things available in PATH.
  #    export PATH=/run/current-system/sw/bin/:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
  #  '';
  #};

  # # For macOS's default shell.
  #zsh = {
  #  enable = true;
  #  envExtra = ''
  #    # Make Nix and home-manager installed things available in PATH.
  #    export PATH=/run/current-system/sw/bin/:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
  #  '';
  #};

  # # https://haskell.flake.page/direnv
  #direnv = {
  #  enable = true;
  #  nix-direnv.enable = true;
  #};
  #starship.enable = true;

  ## Type `z <pat>` to cd to some directory
  #zoxide.enable = true;
  };
}

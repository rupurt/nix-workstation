{ pkgs, ... }:

{
  imports = [
    ./tmux.nix
    ./neovim
    ./zsh.nix
    ./git.nix
    ./direnv.nix
  ];

  # Allow packages that need a paid license
  nixpkgs.config.allowUnfree = true;

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
    minio-client
    mkcert
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
    k3s
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";
}

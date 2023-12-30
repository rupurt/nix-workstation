{pkgs, ...}: {
  imports = [
    ./darwin.nix
    ./linux.nix
  ];

  home.packages = with pkgs;
    [
      # auth
      _1password
      _1password-gui
      # system utils
      htop
      btop
      bat
      tree
      # network utils
      ipcalc
      wireguard-tools
      netbird
      netbird-ui
      ngrok
      tailscale
      whois
      # general utils
      ripgrep
      silver-searcher
      fzf
      asciinema-agg
      grc
      hey
      hurl
      neofetch
      rsync
      watchman
      # data utils
      jq
      jql
      fq
      # reverse engineering
      radare2
      # remote
      upterm
      # development utils
      tmuxinator
      git
      gh
      gnumake
      difftastic
      mkcert
      packer
      wasmtime
      upx
      hugo
      # observability
      prometheus
      grafana
      # storage
      minio-client
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
      (google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
      ])
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

      (nerdfonts.override {fonts = ["FiraCode"];})
    ]
    ++ lib.optionals (pkgs.stdenv.isDarwin) [
      asitop
      xclip
    ]
    ++ lib.optionals (pkgs.stdenv.isLinux) [
      zsh
      # docker
      gotop
      iaito
      insomnia
    ];
}

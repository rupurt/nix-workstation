{pkgs, ...}: {
  imports = [
    ./darwin.nix
    ./linux.nix
  ];

  home.packages = with pkgs;
    [
      # nix
      cachix
      # auth
      _1password
      _1password-gui
      # system utils
      htop
      btop
      zenith
      bat
      tree
      pax-utils
      # network utils
      tcpdump
      dhcpdump
      junkie
      ipcalc
      wireguard-tools
      netbird
      netbird-ui
      ngrok
      tailscale
      whois
      gftp
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
      unzip
      gzip
      # data utils
      jq
      jql
      fq
      # reverse engineering
      radare2
      # remote
      upterm
      # tmux
      tmuxinator
      tmuxp
      # development utils
      git
      gh
      subgit
      difftastic
      mkcert
      packer
      wasmtime
      upx
      hugo
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
      # gpu
      nvtopPackages.full
      gotop
      iaito
      insomnia
      # mainframe
      x3270
    ];
}

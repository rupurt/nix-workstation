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
      _1password-cli
      # system utils
      htop
      btop
      zenith
      bat
      tree
      # network utils
      tcpdump
      ipcalc
      wireguard-tools
      netbird
      netbird-ui
      tailscale
      whois
      # gftp
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
      # http
      httpstat
      # compression
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
      # git
      git
      gh
      subgit
      # development utils
      difftastic
      mkcert
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
      # awscli2
      eksctl
      (google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
      ])
      # load testing
      k6
      # sql
      usql
      sqlite
      sqlite-utils
      # redis
      redis
      # ai
      ollama
      # TODO:
      # - oterm is fixed on main
      # - https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/ot/oterm/package.nix#L52
      # oterm
    ]
    ++ lib.optionals (pkgs.stdenv.isDarwin) [
      asitop
      xclip
    ]
    ++ lib.optionals (pkgs.stdenv.isLinux) [
      # shell
      zsh
      # terminal
      ghostty
      # network utils
      dhcpdump
      junkie
      # system utils
      pax-utils
      # observability
      osquery
      # gpu
      nvtopPackages.full
      gotop
      iaito
      insomnia
      # remote
      # ngrok is broken SSL routines::wrong version number
      # ngrok
      # mainframe
      x3270
    ];
}

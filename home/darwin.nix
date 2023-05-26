{ pkgs, ... }:

{
  homebrew.enable = true;
  homebrew.casks = [
    # "1password-cli"
    # "1password"
    # "beekeeper-studio"
    # "brave-browser"
    # "discord"
    # "docker"
    # "iterm2"
    # "obsidian"
    # "protonvpn"
    # "raycast"
    # "slack"
    "spotify"
    "zoom"
  ];

  # home.packages = with pkgs; [
  #   # unfree
  #   # _1password
  #   #_ 1password-gui
  #   # discord
  #   # zoom-us
  #   # spotify
  # ];
}

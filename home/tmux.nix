{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    escapeTime = 0;
    historyLimit = 4096;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
    ];

    extraConfig = ''
      # Set the default terminal terminfo
      set -g default-terminal "screen-256color"
      # Tell Tmux that outside terminal supports true color
      set -sa terminal-overrides ',xterm-256color:Tc'

      # Copy using mouse with copy-mode
      set -g mouse on

      # Window status bar
      set-option -g status-position bottom

      # Navigate history with vi keys
      set -g status-keys vi
      set -g mode-keys   vi

      # Copy to primary clipboard
      set -g @yank_selection 'primary'
    '';
  };
}

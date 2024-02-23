{pkgs, ...}: {
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
      set -g default-terminal "tmux-256color"
      # Tell Tmux that outside terminal supports true color
      set-option -sa terminal-features ',xterm-kitty:Tc'

      # Copy using mouse with copy-mode
      set -g mouse on

      # Window status bar
      set-option -g status-position bottom

      # Navigate history with vi keys
      set -g status-keys vi
      set -g mode-keys   vi

      # Copy to primary clipboard
      set -g @yank_selection 'primary'

      # Set the window size to the smallest client
      # - useful for remote pairing sessions
      set-window-option -g window-size smallest
    '';
  };
}

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions.frecency.enable = true;
    extensions.fzf-native.enable = true;
    extensions.media_files.enable = true;
    keymaps = {
      "<C-l>" = "live_grep";
      "<C-i>" = "buffers";
      "<C-p>" = "find_files";
    };
  };
}

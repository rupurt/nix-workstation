{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      frecency.enable = true;
      fzf-native.enable = true;
      media-files.enable = true;
    };
    keymaps = {
      "<C-l>" = "live_grep";
      "<C-i>" = "buffers";
      "<C-p>" = "find_files";
    };
  };
}

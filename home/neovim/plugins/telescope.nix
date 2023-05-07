{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions.frecency.enable = true;
    extensions.fzf-native.enable = true;
    extensions.media_files.enable = true;
    keymaps = {
      "<C-p>" = "git_files";
    };
  };
}

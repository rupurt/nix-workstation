{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    folding = true;
    indent = false;
    incrementalSelection = {
      enable = true;
      keymaps = {
        initSelection = "<leader>ss";
        nodeIncremental = "<leader>sn";
        scopeIncremental = "<leader>sc";
        nodeDecremental = "<leader>sd";
      };
    };
  };
}

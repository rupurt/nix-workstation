{
  programs.nixvim = {
    plugins.lspsaga = {
      enable = true;
    };
    keymaps = [
      {
        action = "<cmd>Lspsaga hover_doc<CR>";
        key = "<s-k>";
      }
      {
        action = "<cmd>Lspsaga show_cursor_diagnostics<CR>";
        key = "<leader>kc";
      }
      {
        action = "<cmd>Lspsaga show_workspace_diagnostics<CR>";
        key = "<leader>kw";
      }
      {
        action = "<cmd>Lspsaga code_action<CR>";
        key = "<leader>ca";
      }
      {
        action = "<cmd>Lspsaga goto_definition<CR>";
        key = "gd";
      }
      {
        action = "<cmd>Lspsaga goto_references<CR>";
        key = "gr";
      }
      {
        action = "<cmd>Lspsaga peek_references<CR>";
        key = "gR";
      }
      {
        action = "<cmd>Lspsaga outline<CR>";
        key = "go";
      }
      {
        action = "<cmd>Lspsaga term_toggle<CR>";
        key = "<s-t>";
      }
      {
        action = "<cmd>Lspsaga rename<CR>";
        key = "<leader>rn";
      }
      {
        action = "<cmd>Lspsaga project_replace<CR>";
        key = "<leader>rp";
      }
    ];
  };
}

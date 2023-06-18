{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        cssls.enable = true;
        elixirls.enable = true;
        eslint.enable = true;
        gopls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        nil_ls.enable = true;
        pylsp.enable = true;
        pyright.enable = true;
        rust-analyzer.enable = true;
        tailwindcss.enable = true;
        terraformls.enable = true;
        tsserver.enable = true;
        yamlls.enable = true;
        zls.enable = true;
      };
      keymaps = {
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          "<leader>f" = "format";
          "<leader>rn" = "rename";
          "<leader>ca" = "code_action";
        };
      };
    };
  };
}

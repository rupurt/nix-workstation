{pkgs, ...}: {
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
        nil-ls.enable = true;
        pyright.enable = true;
        ruff-lsp.enable = true;
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        svelte.enable = true;
        tailwindcss.enable = true;
        terraformls.enable = true;
        # tsserver.enable = true;
        ts-ls.enable = true;
        yamlls.enable = true;
        # zls fails to compile on darwin with the current flake.lock
        zls.enable = false;
      };
      keymaps = {
        lspBuf = {
          gi = "implementation";
          "<leader>f" = "format";
        };
      };
    };
  };
}

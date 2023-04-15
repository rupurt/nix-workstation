{ config, lib, pkgs, ... }:

{
  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;

    plugins = {
      comment-nvim = {
        enable = true;
      };
      copilot = {
        enable = true;
      };
      # - has snippets
      # - would not need luasnip
      coq-nvim = {
         enable = true;
         autoStart = true;
         recommendedKeymaps = true;
         installArtifacts = true;
      };
      coq-thirdparty = {
        enable = true;
        sources = [
          { src = "copilot"; accept_key = "<c-f>"; short_name = "COP"; }
        ];
      };
      goyo = {
        enable = true;
      };
      # luasnip = {
      #   enable = true;
      # };
      lightline = {
        enable = true;
        colorscheme = "wombat";
      };
      lsp = {
        enable = true;
        servers = {
          cssls.enable = true;
          elixirls.enable = true;
          eslint.enable = true;
          gopls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          pyright.enable = true;
          rnix-lsp.enable = true;
          rust-analyzer.enable = true;
          tailwindcss.enable = true;
          tsserver.enable = true;
          zls.enable = true;
        };
      };
      magma-nvim = {
        enable = true;
      };
      neorg = {
        enable = true;
      };
      # causes cursor lag
      # noice = {
      #   enable = true;
      # };
      nvim-osc52 = {
        enable = true;
      };
      sniprun = {
        enable = true;
      };
      specs = {
        enable = true;
      };
      surround = {
        enable = true;
      };
      telescope = {
        enable = true;
        extensions.frecency.enable = true;
        extensions.fzf-native.enable = true;
        extensions.media_files.enable = true;
        keymaps = {
          "<C-p>" = "git_files";
        };
      };
      todo-comments = {
        enable = true;
      };
      treesitter = {
        enable = true;
      };
      trouble = {
        enable = true;
      };
      vim-matchup = {
        enable = true;
      };
    };

    maps = {
      normal = {
        "<leader>m" = {
          # silent = true;
          action = "<cmd>make<CR>";
        };
        "\\".action = "<cmd>Explore<CR>";
        # "<space>f" = "vim.lsp.buf.format('textDocument/formatting')";
      };
      # insert = {
      #   "\"".action = "\"\"<left>";
      #   "'".action = "''<left>";
      #   "(".action = "()<left>";
      #   "(<CR>".action = "(<CR>)<ESC>0";
      #   "(;<CR>".action = "(<CR>);<ESC>0";
      #   "[".action = "[]<left>";
      #   "[<CR>".action = "[<CR>]<ESC>0";
      #   "[;<CR>".action = "[<CR>];<ESC>0";
      #   "{".action = "{}<left>";
      #   "{<CR>".action = "{<CR>}<ESC>0";
      #   "{;<CR>".action = "{<CR>};<ESC>0";
      # };
      visual = {
      };
    };

    options = {
      number = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      clipboard = "unnamed"; # mac+windows
      # clipboard = "unnamedplus"; # linux
      wrap = false;
    };

    # extraConfigLua = ''
    #   -- Print a little welcome message when nvim is opened!
    #   print("Hello world!")
    # '';
  };
}

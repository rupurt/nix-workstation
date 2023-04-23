{ config, lib, pkgs, ... }:

{
  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;

    colorschemes.base16 = {
      enable = true;
      colorscheme = "monokai";
    };

    globals.mapleader = " ";

    plugins = {
      comment-nvim = {
        enable = true;
      };
      copilot = {
        enable = true;
      };
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
      lightline = {
        enable = true;
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
            gt = "type_definition";
            "<leader>f" = "format";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
          };
        };
      };
      magma-nvim = {
        enable = true;
      };
      neorg = {
        enable = true;
      };
      # noice = {
      #   enable = true;
      #   lsp.hover.enabled = true;
      #   lsp.message.enabled = true;
      #   lsp.signature.enabled = true;
      #   notify.enabled = true;
      #   popupmenu.enabled = true;
      # };
      # notify = {
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
      treesitter-playground = {
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
      visual = { };
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

{...}: {
  imports = [
    ./plugins
    ./options
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    luaLoader.enable = true;

    colorschemes = {
      gruvbox = {
        enable = false;
      };
      rose-pine = {
        enable = true;
        style = "moon";
      };
    };

    maps = {
      normal = {
        "<leader>m" = {
          # silent = true;
          action = "<cmd>make<CR>";
        };
        "\\".action = "<cmd>Explore<CR>";
        "<leader>g".action = "<cmd>DiffviewOpen<CR>";
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
      visual = {};
    };

    # extraConfigLua = ''
    #   -- Print a little welcome message when nvim is opened!
    #   print("Hello world!")
    # '';
  };
}

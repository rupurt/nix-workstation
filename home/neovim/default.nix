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

    keymaps = [
      {
        action = "<cmd>make<CR>";
        key = "<leader>m";
      }
      {
        action = "<cmd>Explore<CR>";
        key = "\\";
      }
      {
        action = "<cmd>DiffviewOpen<CR>";
        key = "<leader>g";
      }
    ];
  };
}

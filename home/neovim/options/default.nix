{ lib, ...}: {
  programs.nixvim.options = {
    number = true;
    expandtab = true;
    tabstop = 2;
    shiftwidth = 2;
    clipboard = lib.mkDefault "unnamed"; # mac+windows
    wrap = false;
  };
}

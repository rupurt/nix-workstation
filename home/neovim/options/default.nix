{ pkgs, ... }:
{
  programs.nixvim.options = {
    number = true;
    expandtab = true;
    tabstop = 2;
    shiftwidth = 2;
    clipboard = if pkgs.stdenv.isDarwin then "unnamed" else "unnamedplus";
    wrap = false;
  };
}

{
  programs.nixvim.plugins.coq-thirdparty = {
    enable = true;
    sources = [
      {
        src = "copilot";
        accept_key = "<c-f>";
        short_name = "COP";
      }
    ];
  };
}

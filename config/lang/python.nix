{
  plugins = {
    lsp.servers = {
      ruff.enable = true;
      ruff-lsp.enable = true;
    };
    none-ls.sources = {
      formatting.black = {
        enable = true;
        withArgs = ''
          { extra_args = { "--fast" }, }
        '';
      };
      diagnostics.mypy.enable = true;
    };
    conform-nvim.formattersByFt.python = ["black"];
  };
}

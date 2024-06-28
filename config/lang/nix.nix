{
  plugins = {
    nix.enable = true;
    nix-develop.enable = true;
    lsp.servers.nixd.enable = true;
    none-ls = {
      sources = {
        code_actions.statix.enable = true;
        formatting.alejandra.enable = true;
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
        };
      };
    };
    conform-nvim.formattersByFt.nix = ["alejandra"];
  };
}

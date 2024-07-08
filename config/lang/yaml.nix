{
  plugins = {
    lsp.servers.yamlls.enable = true;
    none-ls.sources = {
      formatting.yamlfmt.enable = true;
      diagnostics.yamllint.enable = true;
    };
    conform-nvim.formattersByFt.yaml = ["yamllint" "yamlfmt"];
    schemastore.yaml.enable = true;
  };
}

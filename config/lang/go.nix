{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [vim-go];
  plugins = {
    lsp.servers.gopls.enable = true;
    none-ls.sources = {
      formatting = {
        gofmt.enable = true;
        goimports.enable = true;
      };
      diagnostics = {
        golangci_lint.enable = true;
      };
      code_actions = {
        gomodifytags.enable = true;
      };
    };
  };
}

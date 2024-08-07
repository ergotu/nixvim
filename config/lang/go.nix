{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [go-nvim];
  plugins = {
    lsp.servers.gopls.enable = true;
    none-ls.sources = {
      formatting = {
        gofumpt.enable = true;
        goimports.enable = true;
      };
      diagnostics = {
        golangci_lint.enable = true;
      };
      code_actions = {
        gomodifytags.enable = true;
      };
    };
    dap.extensions.dap-go = {
      enable = true;
      delve.path = "${pkgs.delve}/bin/dlv";
    };
    conform-nvim.formattersByFt.go = ["goimports" "gofumpt"];
  };

  autoCmd = [
    {
      desc = "Change indenting for Go files";
      event = ["FileType"];
      pattern = ["go"];
      command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4";
    }
  ];

  extraConfigLua =
    # lua
    ''
      require('go').setup()
    '';
}

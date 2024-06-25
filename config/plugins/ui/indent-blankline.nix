{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      scope = {
        enabled = true;
      };
      exclude = {
        filetypes = [
          "dashboard"
          "lspinfo"
          "packer"
          "checkhealth"
          "help"
          "man"
          "gitcommit"
          "TelescopePrompt"
          "TelescopeResults"
          "nvimtree"
          "''"
        ];
      };
    };
  };
}

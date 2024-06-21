{
  plugins.indent-blankline = {
    enable = true;
    settings = {
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
          "''"
        ];
      };
    };
  };
}

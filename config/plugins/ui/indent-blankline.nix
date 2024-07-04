{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      scope = {
        show_exact_scope = true;
      };
      indent = {
        char = "▎";
        tab_char = "▎";
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

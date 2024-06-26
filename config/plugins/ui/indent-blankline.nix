{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      scope = {
        enabled = true;
      };
      indent = {
        # highlight = [
        #   "RainbowRed"
        #   "RainbowYellow"
        #   "RainbowBlue"
        #   "RainbowOrange"
        #   "RainbowGreen"
        #   "RainbowViolet"
        #   "RainbowCyan"
        # ];
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

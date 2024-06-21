{opts, ...}: {
  plugins.oil = {
    enable = true;
    settings = {
      useDefaultKeymaps = true;
      float = {
        padding = 2;
        maxWidth = 0;
        maxheight = 0;
        border = "${opts.border}";
        winOptions = {
          winblend = 0;
        };
      };

      preview = {
        border = "${opts.border}";
      };
    };
  };
}

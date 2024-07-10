{icons, ...}: {
  plugins.lualine = {
    enable = true;
    alwaysDivideMiddle = true;
    iconsEnabled = true;
    theme = "catppuccin";
    componentSeparators = {
      left = "";
      right = "";
    };
    sectionSeparators = {
      left = "";
      right = "";
    };
  };
  extraConfigLua =
    # lua
    ''
      require("lualine").setup({
        sections = {
          lualine_x = {
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            },
            {"encoding", "fileformat", "filetype"},
          },
        },
      })
    '';
}

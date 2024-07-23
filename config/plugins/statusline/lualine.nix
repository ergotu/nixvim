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
    disabledFiletypes = {
      statusline = [
        "Trouble"
        "sagaoutline"
        "neo-tree"
      ];
    };
  };
  extraConfigLua =
    # lua
    ''
      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
          }
        end
      end

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
          lualine_b = {
            {
              'b:gitsigns_head',
              icon = '',
            },
            {
              'diff',
              source = diff_source,
            },
            {"diagnostics"},
          },
        },
      })
    '';
}

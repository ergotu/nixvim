{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.bufferline = {
    enable = true;
    diagnostics = "nvim_lsp";
    truncateNames = true;
    offsets = [
      {
        filetype = "undotree";
        text = "Undotree";
        highlight = "PanelHeading";
        padding = 1;
      }
      {
        filetype = "neo-tree";
        text = "Explorer";
        highlight = "PanelHeading";
        padding = 1;
      }
      {
        filetype = "NvimTree";
        text = "Explorer";
        highlight = "PanelHeading";
        padding = 1;
      }
      {
        filetype = "DiffviewFiles";
        text = "Diff View";
        highlight = "PanelHeading";
        padding = 1;
      }
      {
        filetype = "flutterToolsOutline";
        text = "Flutter Outline";
        highlight = "PanelHeading";
      }
    ];
  };

  keymaps = [
    (mkKeymap "n" "<Tab>" "<cmd>bufferlineCycleNext<cr>" "Cycle to next buffer")
    (mkKeymap "n" "<S-Tab>" "<cmd>bufferlineCyclePrevious<cr>" "Cycle to previous buffer")

    (mkKeymap "n" "<leader>b" "+buffer" "+buffer")
    (mkKeymap "n" "<leader>bp" "<cmd>:BufferLinePick<cr>" "BufferLine Pick")
    (mkKeymap "n" "<leader>bP" "<cmd>BufferLineTogglePin<cr>" "Buffer Pin")
    (mkKeymap "n" "<leader>bd" "<cmd>BufferLineSortByDirectory<cr>" "Buffer Sort by dir")
    (mkKeymap "n" "<leader>be" "<cmd>BufferLineSortByExtension<cr>" "Buffer Sort by ext")
    (mkKeymap "n" "<leader>bt" "<cmd>BufferLineSortByTabs<cr>" "Buffer Sort by Tabs")
    (mkKeymap "n" "<leader>bL" "<cmd>BufferLineCloseRight<cr>" "Buffer close all to right")
    (mkKeymap "n" "<leader>bH" "<cmd>BufferLineCloseLeft<cr>" "Buffer close all to left")
    (mkKeymap "n" "<leader><s-h>" "<cmd>BufferLineMovePrev<cr>" "Move buffer to left")
    (mkKeymap "n" "<leader><s-l>" "<cmd>BufferLineMoveNext<cr>" "Move buffer to right")
  ];
}

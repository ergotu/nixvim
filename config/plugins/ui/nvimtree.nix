{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.nvim-tree = {
    enable = true;
    disableNetrw = true;
    view = {
      side = "left";
      width = 25;
    };
    respectBufCwd = true;
    autoReloadOnWrite = true;
    git.enable = true;
    filters.dotfiles = true;
    renderer = {
      highlightGit = true;
      indentMarkers.enable = true;
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>e" "<cmd>NvimTreeToggle<CR>" "Toggle NvimTree")
  ];
}

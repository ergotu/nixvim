{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.undotree = {
    enable = true;
    settings = {
      autoOpenDiff = true;
      focusOnToggle = true;
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>ut" "<cmd>UndotreeToggle<CR>" "UndoTree")
  ];
}

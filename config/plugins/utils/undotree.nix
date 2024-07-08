{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.undotree = {
    enable = true;
    settings = {
      DiffAutoOpen = true;
      SetFocusWhenToggle = true;
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>ut" "<cmd>UndotreeToggle<CR>" "UndoTree")
  ];
}

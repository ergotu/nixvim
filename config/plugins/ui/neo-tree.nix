{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.neo-tree = {
    enable = true;
    addBlankLineAtTop = true;
    filesystem = {
      window = {
        mappings = {
          "\\" = "close_window";
        };
      };
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>e" "<cmd>Neotree toggle<CR>" "Toggle Neotree")
    {
      key = "\\";
      action = "<cmd>Neotree reveal<cr>";
      options = {
        desc = "NeoTree reveal";
      };
    }
  ];
}

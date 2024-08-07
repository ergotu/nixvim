{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.flash = {
    enable = true;
    settings = {
      search = {
        mode = "fuzzy";
      };

      jump = {
        autojump = true;
      };

      label = {
        uppercase = false;
        rainbow = {
          enabled = false;
          shade = 5;
        };
      };
    };
  };

  keymaps = [
    (mkKeymap "n" "<cr>" "<cmd>lua require('flash').jump()<cr>" "Flash")
    (mkKeymap "n" "<s-cr>" "<cmd>lua require('flash').treesitter()<cr>" "Flash Treesitter")

    (mkKeymap "x" "<cr>" "<cmd>lua require('flash').jump()<cr>" "Flash")
    (mkKeymap "x" "<s-cr>" "<cmd>lua require('flash').treesitter()<cr>" "Flash Treesitter")
    (mkKeymap "x" "R" "<cmd>lua require('flash').treesitter_search()<cr>" "Flash Treesitter Search")

    (mkKeymap "o" "<cr>" "<cmd>lua require('flash').jump()<cr>" "Flash")
    (mkKeymap "o" "<s-cr>" "<cmd>lua require('flash').treesitter()<cr>" "Flash Treesitter")
    (mkKeymap "o" "r" "<cmd>lua require('flash').remote()<cr>" "Flash Remote")
    (mkKeymap "o" "R" "<cmd>lua require('flash').treesitter_search()<cr>" "Flash Treesitter Search")
  ];
}

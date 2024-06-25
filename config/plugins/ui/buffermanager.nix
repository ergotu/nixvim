{
  inputs,
  pkgs,
  mkKey,
  ...
}: let
  mkPkgs = name: src: pkgs.vimUtils.buildVimPlugin {inherit name src;};

  inherit (mkKey) mkKeymap;
in {
  extraPlugins = [(mkPkgs "buffer_manager" inputs.buffer-manager)];

  keymaps = [
    (mkKeymap "n" "<leader>bm"
      ":lua require('buffer_manager.ui').toggle_quick_menu()<cr>"
      "Toggle buffer manager")
  ];
}

{
  mkKey,
  pkgs,
  inputs,
  ...
}: let
  inherit (mkKey) mkKeymap;
in {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "kulala";
      src = inputs.kulala;
    })
  ];
  extraConfigLua =
    #lua
    ''
      local ok, _ = pcall(require, "kulala")
      if ok then
        require("kulala").setup()
      end
    '';
  keymaps = [
    (mkKeymap "n" "<leader>ukr" "<cmd>lua require('kulala').run()<cr>" "Kulala Run")
    (mkKeymap "n" "<leader>ukt" "<cmd>lua require('kulala').toggle_view()<cr>" "Kulala Toggle View")
  ];
  extraPackages = [pkgs.curl];
}

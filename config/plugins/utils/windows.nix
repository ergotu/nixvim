{
  inputs,
  pkgs,
  mkKey,
  ...
}: let
  inherit (mkKey) mkKeymap;
  mkPkgs = name: src: pkgs.vimUtils.buildVimPlugin {inherit name src;};

  plugins = [
    (mkPkgs "windows" inputs.windows)
    (mkPkgs "windows-mc" inputs.windows-mc)
    (mkPkgs "windows-a" inputs.windows-a)
  ];
in {
  extraConfigLua =
    # lua
    ''
      local set= function(name)
        local ok, p = pcall(require, name)
        if ok then
          p.setup()
        end
      end
      set "windows"
    '';

  extraPlugins = plugins;

  keymaps = [
    (mkKeymap "n" "<c-w>=" "<cmd>WindowsEqualize<cr>" "Equalize windows")
  ];
}

{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [otter-nvim];
  extraConfigLua =
    # lua
    ''
      require("otter").setup()
    '';
}

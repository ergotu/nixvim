{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [nvim-surround];
  extraConfigLua =
    # lua
    ''
      require('nvim-surround').setup()
    '';
}

{pkgs, ...}: {
  plugins.nvim-autopairs = {
    enable = false;
    settings = {
      fast_wrap = {};
      disable_filetype = ["TelescopePrompt" "vim"];
    };
  };
  extraConfigLua =
    # lua
    ''
      require('ultimate-autopair').setup()
    '';

  extraPlugins = with pkgs.vimPlugins; [ultimate-autopair-nvim];
}

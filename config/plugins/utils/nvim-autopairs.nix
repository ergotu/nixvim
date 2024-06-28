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
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      npairs.add_rule(Rule("$$", "$$", "tex"))

    '';

  extraPlugins = with pkgs.vimPlugins; [ultimate-autopair-nvim];
}

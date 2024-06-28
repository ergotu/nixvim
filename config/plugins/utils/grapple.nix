{
  pkgs,
  opts,
  ...
}: {
  extraPlugins = with pkgs.vimPlugins; [grapple-nvim];
  extraConfigLua =
    # lua
    ''
      require('grapple').setup({
        scope = "git_branch",
        win_opts = {
          border = "${opts.border}",
        },
        })
    '';
}

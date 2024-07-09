{
  pkgs,
  inputs,
  mkKey,
  ...
}: let
  inherit (mkKey) mkKeymap;
in {
  plugins = {
    markdown-preview = {enable = true;};
    conform-nvim.formattersByFt.markdown = ["prettierd" "prettier"];
  };
  extraPlugins = [
    pkgs.vimPlugins.glow-nvim
    (pkgs.vimUtils.buildVimPlugin {
      name = "render-markdown";
      src = inputs.markdown-nvim;
    })
  ];
  keymaps = [
    (mkKeymap "n" "<leader>umb" "<cmd>MarkdownPreview<cr>" "Markdown Preview")
    (mkKeymap "n" "<leader>ump" "<cmd>Glow<cr>" "Markdown Preview")
  ];
  extraConfigLua =
    # lua
    ''
      local ok, md = pcall(require, "hl-mdcodeblock")
      if ok then
        md.setup()
      end
      local ok, g = pcall(require, "glow")
      if ok then
        g.setup()
        end
      local ok, markdown = pcall(require, "render-markdown")
      if ok then
        markdown.setup()
      end
    '';
  autoCmd = [
    {
      desc = "Set spellang for markdown files";
      event = ["FileType"];
      pattern = ["md"];
      command = "setlocal spell spellang=en";
    }
  ];
}

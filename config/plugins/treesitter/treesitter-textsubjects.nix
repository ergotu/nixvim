{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [nvim-treesitter-textsubjects];
  extraConfigLua = ''
    require('mini.indentscope').setup({
      symbol = "╎",
    })

    require("nvim-treesitter.configs").setup({
      textsubjects = {
        enable = true,
        prev_selection = ",", -- (Optional) keymap to select the previous prev_selection
        keymaps = {
          ["."] = "textsubject-smart",
          [";"] = "textsubjects-container-outer",
          ["i;"] = { "textsubjects-container-inner", desc = "Select inside containers (classes, functions, etc.)"},
        },
      },
    })
  '';
}

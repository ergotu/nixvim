{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.gitlinker = {
    enable = true;
    callbacks = {"github.com" = "get_github_type_url";};
  };

  keymaps = [
    (mkKeymap "n" "<leader>gy"
      "<cmd>lua require'gitlinker'.get_buf_range_url('n')<cr>"
      "Copy URL to current line number")
    (mkKeymap "v" "<leader>gy"
      "<cmd>lua require'gitlinker'.get_buf_range_url('v')<cr>"
      "Copy URL to currently selected range")
    (mkKeymap "n" "<leader>gY" "<cmd>lua require'gitlinker'.get_repo_url()<cr>"
      "Copy repository homepage URL")
  ];
}

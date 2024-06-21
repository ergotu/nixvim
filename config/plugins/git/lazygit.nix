{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.lazygit = {
    enable = true;
  };

  extraConfigLua = ''
    require("telescope").load_extension("lazygit")
  '';

  keymaps = [
    (mkKeymap "n" "<leader>gg" "<cmd>LazyGit<CR>" "LazyGit")
  ];
}

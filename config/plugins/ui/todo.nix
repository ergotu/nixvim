{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.todo-comments.enable = true;
  highlight.Todo = {
    fg = "Blue";
    bg = "Yellow";
  };

  match.TODO = "TODO";

  keymaps = [
    (mkKeymap "n" "<leader>st" "<cmd>TodoTelescope<CR>" "Search Todo")
    {
      mode = "n";
      key = "<C-t>";
      action.__raw = ''
        function()
          require('telescope.builtin').live_grep({
            default_text="TODO",
            initial_mode="normal"
          })
        end
      '';
      options.silent = true;
    }
  ];
}

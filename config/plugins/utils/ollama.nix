{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.ollama = {
    enable = true;
    model = "llama3";
  };
  keymaps = [
    (mkKeymap "n" "<leader>ao" ":<c-u>lua require('ollama').prompt()<cr>" "Ollama Prompt")
    (mkKeymap "n" "<leader>ag" ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>" "Ollama Generate")

    (mkKeymap "v" "<leader>ao" ":<c-u>lua require('ollama').prompt()<cr>" "Ollama Prompt")
    (mkKeymap "v" "<leader>ag" ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>" "Ollama Generate")
    (mkKeymap "v" "<leader>ae" ":<c-u>lua require('ollama').prompt('Explain_Code')<cr>" "Ollama Explain")
  ];
}

{
  pkgs,
  config,
  lib,
  mkKey,
  ...
}: let
  inherit (mkKey) mkKeymap;

  copilotChatRepo = {
    owner = "copilotc-nvim";
    repo = "CopilotChat.nvim";
    rev = "2771f1fa7af502ea4226a88a792f4e4319199906";
    hash = "sha256-Q+g81BQVQTY5J2c2ZWB7bjJLuNSdI0PAan+75YJ7mI0=";
  };
in {
  config = lib.mkIf (config.assistant == "copilot") {
    extraPlugins = with pkgs.vimUtils; [
      (buildVimPlugin {
        pname = "copilotchat";
        version = "2.4.0";
        src = pkgs.fetchFromGitHub copilotChatRepo;
        meta = {
          description = "Chat with GitHub Copilot in Neovim";
          homepage = "https://github.com/CopilotC-Nvim/CopilotChat.nvim/";
          license = lib.licenses.gpl3;
        };
      })
    ];
    extraConfigLua = ''
      require("CopilotChat").setup { }
    '';

    keymaps = [
      (mkKeymap "x" "<leader>a" "+copilot" "+copilot")
      (mkKeymap "x" "<leader>ae" "<cmd>CopilotChatExplain<cr>" "Copilot Explain")
      (mkKeymap "x" "<leader>af" "<cmd>CopilotChatFix<cr>" "Copilot Fix")
      (mkKeymap "x" "<leader>ad" "<cmd>CopilotChatDocs<cr>" "Copilot Document")
      (mkKeymap "x" "<leader>ac" "<cmd>CopilotChatCommit<cr>" "Copilot Commit")
    ];
  };
}

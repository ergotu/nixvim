{mkKey, ...}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.notify = {
    backgroundColour = "#000000";
    fps = 60;
    render = "compact";
    topDown = false;
  };
  keymaps = [
    (mkKeymap "n" "<leader>un" {
      __raw = "function () require('notify').dismiss() end";
    } "Dismiss notification")
  ];
}

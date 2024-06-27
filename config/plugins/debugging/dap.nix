{
  pkgs,
  mkKey,
  ...
}: let
  inherit (mkKey) mkKeymap;
in {
  plugins.dap = {
    enable = true;
    adapters = {};
    signs = {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "●";
        texthl = "DapBreakpointCondition";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
      };
    };
    extensions = {
      dap-ui = {enable = true;};
      dap-virtual-text = {enable = true;};
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>du" "<cmd>lua require('dapui').toggle()<CR>"
      "Toggle dapui")
    (mkKeymap "n" "<leader>db" "<cmd>lua require('dap').toggle_breakpoint()<CR>"
      "Toggle breakpoint")
  ];
}

{pkgs, ...}: {
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      # Use the "*" filetype to run formatters on all filetypes.
      "*" = ["codespell"];
      # Use the "_" filetype to run formatters on filetypes that don't
      # have other formatters configured.
      "_" = ["trim_whitespace"];
    };
  };
  extraPackages = [
    pkgs.codespell
  ];
}

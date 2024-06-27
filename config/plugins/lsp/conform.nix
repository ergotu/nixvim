{
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = false;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      liquidsoap = ["liquidsoap-prettier"];
      python = ["black"];
      lua = ["stylua"];
      yaml = ["yamllint" "yamlfmt"];
    };
  };
}

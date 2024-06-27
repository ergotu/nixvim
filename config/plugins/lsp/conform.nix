{
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = false;
      timeoutMs = 500;
    };
    notifyOnError = true;
  };
}

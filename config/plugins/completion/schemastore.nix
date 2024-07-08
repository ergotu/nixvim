{lib, ...}: {
  plugins.schemastore = {
    enable = true;
    yaml.enable = lib.mkDefault false;
  };
}

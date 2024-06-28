{lib, ...}: {
  plugins.hardtime = {
    enable = lib.mkDefault true;
    enabled = true;
    disableMouse = false;
    hint = true;
    restrictionMode = "hint";
  };
}

{lib, ...}: {
  plugins.hardtime = {
    enable = lib.mkDefault false;
    enabled = true;
    disableMouse = false;
    hint = true;
    restrictionMode = "hint";
    disabledKeys = {
      "<Down>" = [
      ];
      "<Left>" = [
      ];
      "<Right>" = [
      ];
      "<Up>" = [
      ];
    };
  };
}

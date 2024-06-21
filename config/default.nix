{
  scanPaths,
  lib,
  ...
}: {
  imports = scanPaths ./.;

  options = {
    assistant = lib.mkOption {
      default = "none";
      type = lib.types.enum ["copilot" "none"];
    };
  };
}

{lib, ...}: {
  mkKey = rec {
    mkKeymap = mode: key: action: desc: {
      inherit mode key action;
      options = {
        inherit desc;
        silent = true;
        noremap = true;
      };
    };
    # Make keymap without description:
    mkKeymap' = mode: key: action:
      mkKeymap mode key action null;
    mkKeymapWithOpts = mode: key: action: desc: opts:
      (mkKeymap mode key action desc) // {options = opts;};
  };

  scanPaths = path:
    builtins.map
    (f: (path + "/${f}"))
    (builtins.attrNames
      (lib.attrsets.filterAttrs
        (
          path: _type:
            (_type == "directory") # include directories
            || (
              (path != "default.nix") # ignore default.nix
              && (lib.strings.hasSuffix ".nix" path) # include .nix files
            )
        )
        (builtins.readDir path)));

  icons = import ./icons.nix;
}

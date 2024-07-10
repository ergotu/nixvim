{pkgs, ...}: {
  plugins.image = {
    # TODO: fix ueberzug issue on tmux layout change
    enable = true;
    backend = "ueberzug";
    editorOnlyRenderWhenFocused = true;
    maxWidth = 50;
    maxHeight = 50;
    integrations.markdown.onlyRenderImageAtCursor = true;
  };

  extraLuaPackages = ps: [ps.magick];
  extraPackages = [
    pkgs.imagemagick
  ];
}

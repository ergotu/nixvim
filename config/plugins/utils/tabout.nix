{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [tabout-nvim];
}

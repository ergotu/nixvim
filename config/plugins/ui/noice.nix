{
  plugins.noice = {
    enable = true;
    lsp = {
      override = {
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };
      message = {
        enabled = true;
      };
      hover = {
        enabled = false;
      };
      progress = {
        enabled = false;
        view = "mini";
      };
    };
    messages = {
      enabled = true;
      view = "mini";
      viewWarn = "mini";
      viewError = "notify";
    };
    popupmenu = {
      enabled = true;
      backend = "nui";
    };
    presets = {
      bottom_search = true;
      command_palette = true;
      long_message_to_split = true;
      inc_rename = false;
      lsp_doc_border = false;
    };
  };
}

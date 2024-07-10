{
  opts,
  lib,
  ...
}: {
  highlightOverride = {
    PMenu = {
      ctermbg = "none";
      bg = "none";
    };
  };
  plugins = {
    lspkind.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        window = {
          completion = {
            border = "${opts.border}";
            scrollbar = false;
          };
          documentation = {border = "${opts.border}";};
          snippet.expand =
            # lua
            ''
              function(args)
                require("luasnip").lsp_expand(args.body)
              end
            '';
        };
        sources = [
          {name = "otter";}
          {name = "async_path";}
          {name = "nvim_lsp_signature_help";}
          {
            name = "nvim_lsp";
            keyword_length = 3;
            entry_filter =
              # lua
              ''
                function(entry, ctx)
                  return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
                end
              '';
          }
          {
            name = "nvim_lua";
            keyword_length = 2;
          }
          {name = "luasnip";}
        ];
        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-buffer.enable = true;
    cmp-async-path.enable = true;
    cmp-cmdline.enable = true;
    cmp_luasnip.enable = true;
    cmp-nvim-lsp-signature-help.enable = lib.mkForce false;
  };
  extraConfigLua =
    # lua
    ''
      local ok, lspkind = pcall(require, "lspkind")
      if ok then
        -- setting highlights for
        vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
        vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
        vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
        vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

        require("cmp").setup({

          formatting = {
            format = lspkind.cmp_format({
              maxwidth = 80,
              ellipsis_char = "...",
              show_labelDetails = true,
              before = function(entry, vim_item)
                if entry.source.name == "copilot" then
                  vim_item.kind = icons.kind.Copilot
                  vim_item.kind_hl_group = "CmpItemKindCopilot"
                end

                if entry.source.name == "cmp_tabnine" then
                  vim_item.kind = icons.kind.TabNine
                  vim_item.kind_hl_group = "CmpItemKindTabnine"
                end

                if entry.source.name == "crates" then
                  vim_item.kind = icons.misc.Package
                  vim_item.kind_hl_group = "CmpItemKindCrate"
                end

                if entry.source.name == "lab.quick_data" then
                  vim_item.kind = icons.misc.CircuitBoard
                  vim_item.kind_hl_group = "CmpItemKindConstant"
                end

                if entry.source.name == "emoji" then
                  vim_item.kind = icons.misc.Smiley
                  vim_item.kind_hl_group = "CmpItemKindEmoji"
                end
                ---@diagnostic disable-next-line: redefined-local
                local ok, tw = pcall(require, "tailwindcss-colorizer-cmp")
                if ok then
                  vim_item = tw.formatter(entry, vim_item)
                end

                return vim_item
              end,
            }),
            fields = { "abbr", "menu", "kind" }
          }
        })
      end
    '';
}

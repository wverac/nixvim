{
  pkgs,
  helpers,
  ...
}: {
  # nvim-cmp
  config = {
    # some functions for snippets
    extraConfigLuaPre = ''
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
    '';
    plugins = {
      luasnip = {
        enable = true;
        fromVscode = [{}];
      };

      lspkind = {
        enable = true;
        mode = "symbol_text";
        cmp = {
          enable = true;
          # Custom Theme
          after = ''
            function(entry, vim_item, kind)
                local strings = vim.split(kind.kind, "%s", { trimempty = true })
                kind.kind = " " .. (strings[1] or "") .. " "
                kind.menu = "    (" .. (strings[2] or "") .. ")"
                return kind
            end
          '';
        };
      };
      cmp-emoji.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lsp-document-symbol.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
      cmp-nvim-lua.enable = true;
      cmp_luasnip.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          sources = [
            {name = "nvim_lsp";}
            {name = "nvim_lsp_document_symbol";}
            {name = "nvim_lsp_signature_help";}
            {name = "luasnip";}
            {name = "path";}
            {name = "buffer";}
            {name = "emoji";}
          ];
          window = {
            documentation.max_height = "math.floor(40 * (40 / vim.o.lines))";
            completion = {
              winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None";
              col_offset = -3;
              side_padding = 0;
            };
          };
          formatting = {
            fields = ["kind" "abbr" "menu"];
          };
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_locally_jumpable() then
                  require("luasnip").expand_or_jump()
                elseif has_words_before() then
                  cmp.complete()
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
            "<S-Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  require("luasnip").jump(-1)
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<Up>" = "cmp.mapping.select_prev_item()";
            "<Down>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-u>" = "cmp.mapping.scroll_docs(-4)";
            "<C-d>" = "cmp.mapping.scroll_docs(4)";
          };
        };
      };
    };
    # Snippets
    plugins.friendly-snippets.enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      vim-snippets
    ];

    # Highlights for custom theme
    colorschemes.catppuccin.settings.custom_highlights = ''
      function(colors)
        return
          ${helpers.toLuaObject {
        TelescopeBorder = {
          fg = helpers.mkRaw "colors.mantle";
          bg = helpers.mkRaw "colors.crust";
        };
        TelescopeNormal = {
          bg = helpers.mkRaw "colors.crust";
        };
        TelescopePreviewBorder = {
          fg = helpers.mkRaw "colors.crust";
          bg = helpers.mkRaw "colors.crust";
        };
        TelescopePreviewNormal = {
          bg = helpers.mkRaw "colors.crust";
        };
        TelescopePreviewTitle = {
          fg = helpers.mkRaw "colors.crust";
          bg = helpers.mkRaw "colors.green";
        };
        TelescopePromptBorder = {
          fg = helpers.mkRaw "colors.mantle";
          bg = helpers.mkRaw "colors.mantle";
        };
        TelescopePromptNormal = {
          fg = helpers.mkRaw "colors.text";
          bg = helpers.mkRaw "colors.mantle";
        };
        TelescopePromptPrefix = {
          fg = helpers.mkRaw "colors.red";
          bg = helpers.mkRaw "colors.mantle";
        };
        TelescopePromptTitle = {
          fg = helpers.mkRaw "colors.crust";
          bg = helpers.mkRaw "colors.red";
        };
        TelescopeResultsBorder = {
          fg = helpers.mkRaw "colors.crust";
          bg = helpers.mkRaw "colors.crust";
        };
        TelescopeResultsNormal = {
          bg = helpers.mkRaw "colors.crust";
        };
        TelescopeResultsTitle = {
          fg = helpers.mkRaw "colors.crust";
          bg = helpers.mkRaw "colors.crust";
        };
        PmenuSel = {
          bg = helpers.mkRaw "colors.base";
          fg = "NONE";
        };
        Pmenu = {
          fg = helpers.mkRaw "colors.crust";
          bg = helpers.mkRaw "colors.mantle";
        };
        CmpItemKindSnippet = {
          bg = helpers.mkRaw "colors.mauve";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindKeyword = {
          bg = helpers.mkRaw "colors.red";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindText = {
          bg = helpers.mkRaw "colors.teal";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindMethod = {
          bg = helpers.mkRaw "colors.blue";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindConstructor = {
          bg = helpers.mkRaw "colors.blue";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindFunction = {
          bg = helpers.mkRaw "colors.blue";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindFolder = {
          bg = helpers.mkRaw "colors.blue";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindModule = {
          bg = helpers.mkRaw "colors.blue";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindConstant = {
          bg = helpers.mkRaw "colors.peach";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindField = {
          bg = helpers.mkRaw "colors.green";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindProperty = {
          bg = helpers.mkRaw "colors.green";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindEnum = {
          bg = helpers.mkRaw "colors.green";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindUnit = {
          bg = helpers.mkRaw "colors.green";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindClass = {
          bg = helpers.mkRaw "colors.yellow";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindVariable = {
          bg = helpers.mkRaw "colors.red";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindFile = {
          bg = helpers.mkRaw "colors.blue";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindInterface = {
          bg = helpers.mkRaw "colors.yellow";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindColor = {
          bg = helpers.mkRaw "colors.red";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindReference = {
          bg = helpers.mkRaw "colors.red";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindEnumMember = {
          bg = helpers.mkRaw "colors.red";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindStruct = {
          bg = helpers.mkRaw "colors.blue";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindValue = {
          bg = helpers.mkRaw "colors.peach";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindEvent = {
          bg = helpers.mkRaw "colors.blue";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindOperator = {
          bg = helpers.mkRaw "colors.blue";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindTypeParameter = {
          bg = helpers.mkRaw "colors.blue";
          fg = helpers.mkRaw "colors.crust";
        };
        CmpItemKindCopilot = {
          bg = helpers.mkRaw "colors.teal";
          fg = helpers.mkRaw "colors.crust";
        };
      }}
        end
    '';
  };
}

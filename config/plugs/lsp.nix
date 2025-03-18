{
  lib,
  pkgs,
  ...
}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_fallback = "fallback";
        timeout_ms = 500;
      };
      notify_on_error = true;

      formatters_by_ft = {
        sh = ["shellcheck" "shfmt"];
        python = ["isort" "black"];
        docker = ["hadolint"];
        css = ["prettier"];
        html = ["prettier"];
        json = ["prettier"];
        lua = ["stylua"];
        markdown = ["prettier"];
        nix = ["alejandra"];
        #ruby = ["rubyfmt"];
        terraform = ["tofu_fmt"];
        tf = ["tofu_fmt"];
        #yaml = ["yamlfmt"]; # NOTE: Does not accept empty lines after keys
        yaml = ["prettier"];
      };
    };
  };

  plugins.lsp = {
    enable = true;
    inlayHints = true;
    keymaps = {
      diagnostic = {
        "<leader>E" = "open_float";
        "[" = "goto_prev";
        "]" = "goto_next";
        "<leader>do" = "setloclist";
      };
      lspBuf = {
        "K" = "hover";
        "gD" = "declaration";
        "gd" = "definition";
        "gr" = "references";
        "gI" = "implementation";
        "gy" = "type_definition";
        "<leader>ca" = "code_action";
        "<leader>cr" = "rename";
        "<leader>wl" = "list_workspace_folders";
        "<leader>wr" = "remove_workspace_folder";
        "<leader>wa" = "add_workspace_folder";
      };
    };
    preConfig = ''
      vim.diagnostic.config({
        virtual_text = false,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'always',
        },
      })

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {border = 'rounded'}
      )

      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {border = 'rounded'}
      )
    '';
    postConfig = ''
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    '';
    servers = {
      pylsp = {
        # NOTE: Trouebleshooting this!
        enable = false;
        settings.plugins = {
          black.enabled = true;
          flake8.enabled = true;
          isort.enabled = true;
          jedi.enabled = true;
          pycodestyle.enabled = true;
          pydocstyle.enabled = true;
          pyflakes.enabled = true;
          mccabe.enabled = true;
          rope.enabled = true;
          yapf.enabled = true;
        };
      };
      lua_ls.enable = true; #Lua
      cssls.enable = true; # CSS
      html.enable = true; # HTML
      pyright.enable = true; # Python
      marksman.enable = true; # Markdown
      nil_ls.enable = true; # Nix
      dockerls.enable = true; # Docker
      docker_compose_language_service.enable = true; # Docker compose
      bashls.enable = true; # Bash
      yamlls.enable = true; # YAML
      terraformls.enable = true; # Terraform
      ansiblels.enable = true; #Ansible
      nginx_language_server.enable = true; #Nginx
    };
  };

  plugins.cmp = {
    enable = true;
    settings = {
      autoEnableSources = true;
      performance = {
        debounce = 150;
      };
      sources = [
        {name = "path";}
        {
          name = "nvim_lsp";
          keywordLength = 1;
        }
        {
          name = "buffer";
          keywordLength = 3;
        }
      ];

      snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
      formatting = {
        fields = [
          "menu"
          "abbr"
          "kind"
        ];
        format = lib.mkForce ''
          function(entry, item)
            local menu_icon = {
              nvim_lsp = '[LSP]',
              luasnip = '[SNIP]',
              buffer = '[BUF]',
              path = '[PATH]',
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end
        '';
      };

      mapping = lib.mkForce {
        "<Up>" = "cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select})";
        "<Down>" = "cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select})";

        "<C-p>" = "cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select})";
        "<C-n>" = "cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select})";

        "<C-u>" = "cmp.mapping.scroll_docs(-4)";
        "<C-d>" = "cmp.mapping.scroll_docs(4)";

        "<C-e>" = "cmp.mapping.abort()";
        "<C-y>" = "cmp.mapping.confirm({select = true})";
        "<CR>" = "cmp.mapping.confirm({select = false})";

        "<C-f>" = ''
          cmp.mapping(
            function(fallback)
              if luasnip.jumpable(1) then
                luasnip.jump(1)
              else
                fallback()
              end
            end,
            { "i", "s" }
          )
        '';

        "<C-b>" = ''
          cmp.mapping(
            function(fallback)
              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end,
            { "i", "s" }
          )
        '';

        "<Tab>" = ''
          cmp.mapping(
            function(fallback)
              local col = vim.fn.col('.') - 1

              if cmp.visible() then
                cmp.select_next_item(select_opts)
              elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
              else
                cmp.complete()
              end
            end,
            { "i", "s" }
          )
        '';

        "<S-Tab>" = ''
          cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item(select_opts)
              else
                fallback()
              end
            end,
            { "i", "s" }
          )
        '';
      };
      window = {
        completion = {
          border = "rounded";
          winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
          zindex = 1001;
          scrolloff = 0;
          colOffset = 0;
          sidePadding = 1;
          scrollbar = true;
        };
        documentation = {
          border = "rounded";
          winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
          zindex = 1001;
          maxHeight = 20;
        };
      };
    };
  };

  plugins.cmp-nvim-lsp.enable = true;
  plugins.cmp-buffer.enable = true;
  plugins.cmp-path.enable = true;
  plugins.cmp-treesitter.enable = true;
  plugins.dap.enable = true;
  plugins.trouble = {
    enable = true;
    settings = {};
  };
  plugins.none-ls = {
    enable = true;
    sources.formatting = {
      black.enable = true;
      alejandra.enable = true;
      hclfmt.enable = true;
      opentofu_fmt.enable = true;
      prettier.enable = true;
      sqlformat.enable = true;
      stylua.enable = true;
      yamlfmt.enable = true;
    };
    sources.diagnostics = {
      trivy.enable = true;
      yamllint.enable = true;
    };
  };

  plugins.lint = {
    enable = true;
    lintersByFt = {
      text = ["vale"];
      json = ["jsonlint"];
      markdown = ["prettier"];
      #ruby = ["rubyfmt"];
      dockerfile = ["hadolint"];
      terraform = ["tofu_fmt"];
      tf = ["tofu_fmt"];
      bash = ["shellcheck"];
      yaml = ["yamlfmt"];
      nix = ["alejandra"];
      go = ["golangci-lint"];
      python = ["flake8"];
      haskell = ["hlint"];
      lua = ["selene"];
    };
    linters = {
      hadolint = {
        cmd = "${pkgs.hadolint}/bin/hadolint";
      };
    };
  };
  plugins.copilot-chat = {
    enable = false;
  };

  plugins.copilot-cmp = {
    enable = false;
  };
  plugins.copilot-lua = {
    enable = false;
    settings = {
      suggestion = {
        enabled = false;
      };
      panel = {
        enabled = false;
      };
    };
  };
  # extraConfigLua = ''
  #   require("copilot").setup({
  #     suggestion = { enabled = false },
  #     panel = { enabled = false },
  #   })
  # '';
  keymaps = [
    {
      key = "<leader>ct";
      action = "<CMD>CopilotChatToggle<CR>";
      options.desc = "Toggle Copilot Chat Window";
    }
    {
      key = "<leader>cs";
      action = "<CMD>CopilotChatStop<CR>";
      options.desc = "Stop current Copilot output";
    }
    {
      key = "<leader>cr";
      action = "<CMD>CopilotChatReview<CR>";
      options.desc = "Review the selected code";
    }
    {
      key = "<leader>ce";
      action = "<CMD>CopilotChatExplain<CR>";
      options.desc = "Give an explanation for the selected code";
    }
    {
      key = "<leader>cd";
      action = "<CMD>CopilotChatDocs<CR>";
      options.desc = "Add documentation for the selection";
    }
    {
      key = "<leader>cp";
      action = "<CMD>CopilotChatTests<CR>";
      options.desc = "Add tests for my code";
    }
  ];

  plugins.markdown-preview = {
    enable = true;
    settings.theme = "dark";
  };
  plugins.render-markdown.enable = true;
}

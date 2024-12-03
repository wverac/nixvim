{
  helpers,
  pkgs,
  ...
}: {
  imports = [./none-ls.nix ./nvim-cmp.nix];
  config = {
    plugins = {
      #LSP Formatting
      lsp-format.enable = true;
      gitsigns = {
        enable = true;
        settings.current_line_blame = true;
      };
      # Native LSP
      lsp = {
        enable = true;
        servers = {
          gopls.enable = true;
          nil-ls.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          tsserver = {
            enable = true;
            # onAttach.function = ''
            #   client.server_capabilities.documentFormattingProvider = false
            # '';
          };
          biome = {
            enable = true;
            onAttach.function = ''
              client.server_capabilities.documentFormattingProvider = false
            '';
          };
          tailwindcss.enable = true;
          cssls.enable = true;
          astro.enable = true;
          volar.enable = true;
          lua-ls = {
            enable = true;
            settings = {
              workspace.library = [
                (helpers.mkRaw "vim.api.nvim_get_runtime_file(\"\", true)")
                "${pkgs.awesome}/share/awesome/lib"
              ];
            };
          };
          omnisharp.enable = true;
          ruff-lsp.enable = true;
          pyright.enable = true;
          elixirls.enable = true;
          dartls.enable = true;
          java-language-server.enable = true;
        };
      };
      # LSP saga
      lspsaga = {
        enable = true;
        symbolInWinbar.enable = false;
        lightbulb.sign = false; # disable bulb in status col
        lightbulb.virtualText = true; # enable at end of line
      };

      # Emmet
      emmet = {
        enable = true;
        settings.leader_key = "<c-z>";
      };
    };
    # LSP Mappings
    keymaps = [
      # Async LSP Finder
      {
        key = "<leader>lf";
        mode = ["n"];
        action = ":Lspsaga finder def+ref<CR>";
        options = {
          silent = true;
          desc = "Lspsaga Finder";
        };
      }
      # Call hierarchy
      {
        key = "<leader>lci";
        mode = ["n"];
        action = ":Lspsaga incoming_calls<CR>";
        options = {
          silent = true;
          desc = "Lspsaga Incoming Calls";
        };
      }
      {
        key = "<leader>lco";
        mode = ["n"];
        action = ":Lspsaga outgoing_calls<CR>";
        options = {
          silent = true;
          desc = "Lspsaga Outgoing Calls";
        };
      }
      # Code Action
      {
        key = "<leader>la";
        mode = ["n"];
        action = ":Lspsaga code_action<CR>";
        options = {
          silent = true;
          desc = "Code Action";
        };
      }
      {
        key = "<leader>la";
        mode = ["v"];
        action = ":<C-U>Lspsaga range_code_action<CR>";
        options = {
          silent = true;
          desc = "Code Action";
        };
      }
      # Rename
      {
        key = "<leader>lr";
        mode = ["n"];
        action = ":Lspsaga rename<CR>";
        options = {
          silent = true;
          desc = "LSP Rename";
        };
      }
      # Peek Definitions
      {
        key = "<leader>lpd";
        mode = ["n"];
        action = ":Lspsaga peek_definition<CR>";
        options = {
          silent = true;
          desc = "Peek Definition";
        };
      }
      {
        key = "<leader>lpt";
        mode = ["n"];
        action = ":Lspsaga peek_type_definition<CR>";
        options = {
          silent = true;
          desc = "Peek Type Definition";
        };
      }
      # Goto
      {
        key = "gD";
        mode = ["n"];
        action = "<Cmd>lua vim.lsp.buf.declaration()<CR>";
        options = {
          silent = true;
          desc = "Goto Declaration";
        };
      }
      {
        key = "gd";
        mode = ["n"];
        action = "<Cmd>:Lspsaga goto_definition<CR>";
        options = {
          silent = true;
          desc = "Goto Definition";
        };
      }
      {
        key = "gi";
        mode = ["n"];
        action = "<Cmd>lua vim.lsp.buf.implementation()<CR>";
        options = {
          silent = true;
          desc = "Goto Implementation";
        };
      }
      # LSP Outline
      {
        key = "<leader>lo";
        mode = ["n"];
        action = "<Cmd>Lspsaga outline<CR>";
        options = {
          silent = true;
          desc = "LSP Outline";
        };
      }
      # Workspace
      {
        key = "<space>wa";
        mode = ["n"];
        action = "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>";
        options = {
          silent = true;
          desc = "Add folder to workspace";
        };
      }
      {
        key = "<space>wr";
        mode = ["n"];
        action = "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>";
        options = {
          silent = true;
          desc = "Remove folder from workspace";
        };
      }
      {
        key = "<space>wl";
        mode = ["n"];
        action.__raw = ''
          function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end
        '';
        options = {
          desc = "Show all workspace folders";
        };
      }
      # Hover
      {
        key = "<leader>lk";
        mode = ["n"];
        action = "<Cmd>Lspsaga hover_doc<CR>";
        options = {
          silent = true;
          desc = "Hover Info";
        };
      }
      {
        key = "K";
        mode = ["n"];
        action = "<Cmd>Lspsaga hover_doc<CR>";
        options = {
          silent = true;
          desc = "Hover Info";
        };
      }
      {
        key = "<leader>ll";
        mode = ["n"];
        action = "<Cmd>Lspsaga show_line_diagnostics<CR>";
        options = {
          silent = true;
          desc = "Show Line Diagnostics";
        };
      }
      # Move Between Diagnostics
      {
        key = "[d";
        mode = ["n"];
        action = "<Cmd>lua vim.diagnostic.goto_prev()<CR>";
        options = {
          silent = true;
          desc = "Previous Diagnostic";
        };
      }
      {
        key = "]d";
        mode = ["n"];
        action = "<Cmd>lua vim.diagnostic.goto_next()<CR>";
        options = {
          silent = true;
          desc = "Next Diagnostic";
        };
      }
    ];
  };
}

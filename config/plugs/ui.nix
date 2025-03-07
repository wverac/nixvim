{
  plugins = {
    neo-tree = {
      enable = true;
      sources = [
        "filesystem"
        "buffers"
        "git_status"
        "document_symbols"
      ];
      addBlankLineAtTop = false;

      filesystem = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
      };

      defaultComponentConfigs = {
        indent = {
          withExpanders = true;
          expanderCollapsed = "󰅂";
          expanderExpanded = "󰅀";
          expanderHighlight = "NeoTreeExpander";
        };

        gitStatus = {
          symbols = {
            added = " ";
            conflict = "󰩌 ";
            deleted = "󱂥";
            ignored = " ";
            modified = " ";
            renamed = "󰑕";
            staged = "󰩍";
            unstaged = "";
            untracked = " ";
          };
        };
      };
    };

    which-key = {
      enable = true;
    };

    gitsigns = {
      enable = true;
    };

    fugitive = {
      enable = true;
    };

    todo-comments = {
      enable = true;
    };

    bufferline = {
      enable = true;
      settings.options = {
        buffer_close_icon = null;
        close_icon = null;
        always_show_bufferline = true;
        separator_style = "thin";
        show_buffer_close_icons = false;
        diagnostics = "nvim_lsp";
        offsets = [
          {filetype = "neo-tree";}
          {text = "File Explorer";}
          {highlight = "Directory";}
          {text_align = "center";}
          {separator = true;}
        ];
      };
    };

    toggleterm = {
      enable = true;
      settings.float_opts.border = "curved";
    };

    treesitter = {
      enable = true;
      settings.indent.enable = true;
    };
    # NOTE: This is annoying using the corne keyboard
    nvim-autopairs.enable = false;

    indent-blankline = {
      enable = true;
      settings = {
        scope = {
          show_end = true;
          show_exact_scope = true;
          show_start = true;
        };
      };
    };

    telescope.enable = true;

    notify = {
      enable = true;
      settings = {
        render = "minimal";
      };
    };

    colorizer.settings = {
      enable = true;
      userDefaultOptions.names = false;
      filetypes = ["css" "scss"];
    };

    image.enable = true;
    noice.enable = true;
    web-devicons.enable = true;
  };
}

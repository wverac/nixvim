{
  plugins = {
    lualine = {
      enable = true;
      settings = {
        # https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        optionstheme = "horizon";
        settings.options.disabled_filetypes = {
          statusline = [
            "nvimtree"
            "NvimTree"
            "nvim-tree"
            "NvimTree_1"
          ];
          winbar = [
            "nvimtree"
            "NvimTree"
            "nvim-tree"
            "NvimTree_1"
          ];
        };
      };
    };

    which-key = {
      enable = true;
    };

    bufferline = {
      enable = true;
      settings.options = {
        buffer_close_icon = null;
        close_icon = null;
        always_show_bufferline = false;
        separator_style = [
          "|"
          "|"
        ];
        show_buffer_close_icons = false;
        diagnostics = "nvim_lsp";
        offsets = [
          {filetype = "NvimTree";}
          {text = "File Explorer";}
          {highlight = "Directory";}
          {separator = true;}
        ];
      };
    };

    toggleterm = {
      enable = true;
      settings.float_opts.border = "curved";
    };

    nvim-tree = {
      enable = true;
      git = {
        enable = true;
        ignore = false;
      };
      renderer = {
        highlightGit = true;
        rootFolderLabel = false;
        indentMarkers = {
          enable = true;
          icons = {
            bottom = "─";
            edge = "│";
            corner = "╰";
          };
        };
        icons = {
          glyphs = {
            default = "󰈚 ";
            folder = {
              default = " ";
              empty = " ";
              emptyOpen = " ";
              open = " ";
              symlink = " ";
            };
            git = {
              unmerged = "";
            };
          };
        };
      };
      view.side = "left";
      hijackCursor = true;
    };

    treesitter = {
      enable = true;
      settings.indent.enable = true;
    };

    gitsigns = {
      enable = true;
      settings.signs = {
        add.text = "│";
        change.text = "│";
        delete.text = "│";
        topdelete.text = "󰍵";
        changedelete.text = "~";
        untracked.text = "│";
      };
    };

    nvim-autopairs.enable = true;

    indent-blankline = {
      enable = true;
      settings = {
        scope = {
          show_end = false;
          show_exact_scope = true;
          show_start = false;
        };
      };
    };

    telescope.enable = true;

    notify = {
      enable = true;
      render = "minimal";
    };

    nvim-colorizer = {
      enable = true;
      userDefaultOptions.names = false;
      fileTypes = ["css" "scss"];
    };

    image.enable = true; # image support
    noice.enable = true; # popup cmd prompt

    web-devicons.enable = true;
  };
}

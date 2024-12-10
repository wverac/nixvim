{...}: {
  globals.mapleader = " ";
  keymaps = [
    {
      key = "<esc>";
      action = ":noh<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Clear search";
      };
    }
    # Line numbers
    {
      key = "<leader>ln";
      action = "<cmd>set nonumber norelativenumber<CR>:lua vim.diagnostic.hide()<CR>:IBLDisable<CR>{ noremap = true, silent = true })<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle line number off";
      };
    }
    {
      key = "<leader>ll";
      action = "<cmd>set number relativenumber<CR>:lua vim.diagnostic.show()<CR>:IBLEnable<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle line number on";
      };
    }
    # Git
    {
      key = "<leader>gs";
      action = "<cmd>Git<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Open Git status";
      };
    }
    {
      key = "<leader>gw";
      action = "<cmd>Gwrite<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Stage the current file";
      };
    }
    {
      key = "<leader>gc";
      action = "<cmd>Git commit<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Commit changes";
      };
    }
    {
      key = "<leader>gp";
      action = "<cmd>Git push<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Push changes";
      };
    }
    {
      key = "<leader>gl";
      action = "<cmd>Git pull<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Pull changes";
      };
    }
    {
      key = "<leader>gb";
      action = "<cmd>Gblame<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "View blame for the current file";
      };
    }
    {
      key = "<leader>gd";
      action = "<cmd>Gdiffsplit<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Diff against HEAD";
      };
    }
    {
      key = "<leader>go";
      action = "<cmd>GBrowse<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Browse repository in Git's web UI";
      };
    }
    # Buffer tabs
    {
      key = "<leader>b";
      action = "<cmd> enew <CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "New buffer";
      };
    }

    {
      key = "<tab>";
      action = "<cmd> BufferLineCycleNext <CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Next buffer";
      };
    }

    {
      key = "<S-tab>";
      action = "<cmd> BufferLineCyclePrev <CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous buffer";
      };
    }
    {
      key = "<leader>x";
      action = ":bd <CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Delete buffer";
      };
    }
    {
      key = "<leader>tp";
      action = "<cmd> BufferLineTogglePin <CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Pin buffer";
      };
    }
    # Window movement
    {
      key = "<C-j>";
      action = "<C-w>j";
      mode = "n";
      options.desc = "Move down";
    }

    {
      key = "<C-k>";
      action = "<C-w>k";
      mode = "n";
      options.desc = "Move up";
    }

    {
      key = "<C-h>";
      action = "<C-w>h";
      mode = "n";
      options.desc = "Move left";
    }

    {
      key = "<C-l>";
      action = "<C-w>l";
      mode = "n";
      options.desc = "Move right";
    }
    # Terminal
    {
      key = "<Leader>tw";
      action = "<cmd> ToggleTerm direction=tab <CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle Terminal Window";
      };
    }
    {
      key = "<Leader>th";
      action = "<cmd> ToggleTerm direction=horizontal <CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Horizontal terminal";
      };
    }

    {
      key = "<Leader>tv";
      action = "<cmd>ToggleTerm direction=vertical size=60 <CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Vertical terminal";
      };
    }

    {
      key = "<Leader>tf";
      action = "<cmd> ToggleTerm direction=float <CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Floating terminal";
      };
    }
    # Update Treesitter Parsers
    {
      key = "<Leader>tu";
      action = "<cmd>TSUpdate<CR>";
      mode = "n";
      options.desc = "Update Treesitter Parsers";
    }
    # Formart nix with alejandra
    # TODO: Condition to use it only in nix filetypes
    {
      key = "<Leader>ale";
      action = ":%!alejandra -qq<CR>";
      mode = "n";
      options.desc = "Format with Alejandra";
    }

    # Notify dismiss all
    {
      key = "<Leader>nn";
      action = ''
        <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>'';
      mode = "n";
      options.desc = "Dismiss All Notifications";
    }
    # Git
    {
      key = "<Leader>gsr";
      action = ":Gitsigns reset_hunk <CR>";
      mode = "n";
      options.desc = "Reset hunk";
    }

    {
      key = "<Leader>gsh";
      action = ":Gitsigns stage_hunk <CR>";
      mode = "n";
      options.desc = "Stage hunk";
    }

    {
      key = "<Leader>gsu";
      action = ":Gitsigns undo_stage_hunk <CR>";
      mode = "n";
      options.desc = "Undo stage hunk";
    }

    {
      key = "<Leader>gh";
      action = ":Gitsigns preview_hunk <CR>";
      mode = "n";
      options.desc = "Preview hunk";
    }

    {
      key = "<Leader>gb";
      action = ":Gitsigns blame_line<CR>";
      mode = "n";
      options.desc = "Git blame";
    }
    # Tree
    {
      key = "<Leader>e";
      action = "<cmd> Neotree toggle <CR>";
      mode = "n";
      options.desc = "Toggle tree";
    }
    # Telescope stuff
    {
      key = "<Leader>ff";
      action = "<cmd> Telescope fd <CR>";
      mode = "n";
      options.desc = "Find files";
    }

    {
      key = "<Leader>gsc";
      action = "<cmd> Telescope git_commits <CR>";
      mode = "n";
      options.desc = "Git show commits";
    }

    {
      key = "<Leader>fr";
      action = "<cmd> Telescope oldfiles <CR>";
      mode = "n";
      options.desc = "Find recents";
    }

    {
      key = "<Leader>fg";
      action = "<cmd> Telescope live_grep <CR>";
      mode = "n";
      options.desc = "Telescope live grep";
    }

    {
      key = "<Leader>tn";
      action = "<cmd> Telescope notify <CR>";
      mode = "n";
      options.desc = "Recent notifications";
    }

    {
      key = "<Leader>te";
      action = "<cmd> TodoQuickFix <CR>";
      mode = "n";
      options.desc = "TODO summary";
    }

    {
      key = "<Leader>tc";
      action = "<cmd> TodoTelescope <CR>";
      mode = "n";
      options.desc = "TODO telescope";
    }
  ];

  plugins.which-key = {
    #   settings.spec = [
    #     {
    #       __unkeyed-1 = "<Leader>gD";
    #       desc = "Goto reference";
    #     }
    #
    #     {
    #       __unkeyed-1 = "<Leader>gd";
    #       desc = "Goto definition";
    #     }
    #
    #     {
    #       __unkeyed-1 = "<Leader>d";
    #       desc = "DAP options";
    #     }
    #
    #     {
    #       __unkeyed-1 = "<Leader>g";
    #       desc = "Git options";
    #     }
    #
    #     {
    #       __unkeyed-1 = "<Leader>gs";
    #       desc = "Git stage options";
    #     }
    #
    #     {
    #       __unkeyed-1 = "<Leader>gc";
    #       desc = "Comment lines";
    #     }
    #     {
    #       __unkeyed-1 = "<Leader>gcc";
    #       desc = "Comment line";
    #     }
    #   ];
  };
}

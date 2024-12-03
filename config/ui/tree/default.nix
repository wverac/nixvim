{...}: {
  config = {
    plugins.neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      autoCleanAfterSessionRestore = true;
      sourceSelector = {
        # winbar = true;
        contentLayout = "focus";
        sources = [
          {
            source = "filesystem";
            displayName = " File";
          }
          {
            source = "buffers";
            displayName = " Buffer";
          }
          {
            source = "git_status";
            displayName = " Git";
          }
          {
            source = "diagnostics";
            displayName = " Diagnostics";
          }
        ];
      };
      defaultComponentConfigs = {
        indent = {
          padding = 0;
          indentSize = 1;
        };
        icon = {
          folderClosed = "";
          folderOpen = "";
          folderEmpty = "";
          default = "";
        };
        modified.symbol = "";
        gitStatus.symbols = {
          added = "";
          deleted = "";
          modified = "";
          renamed = "➜";
          untracked = "★";
          ignored = "◌";
          unstaged = "✗";
          staged = "✓";
          conflict = "";
        };
      };
      closeIfLastWindow = true;
      window.width = 30;
      filesystem = {
        bindToCwd = true;
        followCurrentFile.enabled = true;
        useLibuvFileWatcher = true;
      };
      buffers = {
        bindToCwd = true;
        followCurrentFile.enabled = true;
      };
    };
    keymaps = [
      {
        key = "<leader>e";
        mode = ["n" "v"];
        action = "<cmd>Neotree toggle<cr>";
        options = {
          desc = "Neotree toggle";
        };
      }
      {
        key = "<leader>o";
        mode = ["n" "v"];
        action.__raw = ''
          function()
            if vim.bo.filetype == "neo-tree" then
              vim.cmd.wincmd "p"
            else
              vim.cmd.Neotree "focus"
            end
          end
        '';
        options = {
          desc = "Neotree toggle focus";
        };
      }
    ];
  };
}

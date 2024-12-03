{...}: {
  config = {
    plugins.barbar = {
      enable = true;
      settings = {
        exclude_name = ["alpha"];
        sidebar_filetypes = {
          "neo-tree" = {
            event = "BufWipeout";
          };
        };
        semantic_letters = true;
        maximum_length = 30;
        minimum_padding = 1;
        maximum_padding = 1;
        clickable = true;
        animation = true;
        icons = {
          button = "";
          filetype = {
            enabled = true;
            custom_colors = true;
          };
        };
      };
    };
    # Stuff to restore buffers after session restore [https://github.com/romgrk/barbar.nvim?tab=readme-ov-file#custom]
    extraConfigLua = ''
      vim.opt.sessionoptions:append "globals"
      vim.api.nvim_create_user_command(
          "Mksession",
          function(attr)
              vim.api.nvim_exec_autocmds("User", {pattern = "SessionSavePre"})
              -- Neovim 0.8+
              vim.cmd.mksession {bang = attr.bang, args = attr.fargs}
          end,
          {bang = true, complete = "file", desc = "Save barbar with :mksession", nargs = "?"}
      )
    '';
    keymaps = [
      {
        key = "]b";
        mode = ["n"];
        action = "<cmd>BufferNext<cr>";
        options = {
          silent = true;
          desc = "Next Buffer";
        };
      }
      {
        key = "[b";
        mode = ["n"];
        action = "<cmd>BufferPrevious<cr>";
        options = {
          silent = true;
          desc = "Previous Buffer";
        };
      }
      # Pin/unpin buffer
      {
        key = "<leader>bp";
        mode = ["n"];
        action = "<cmd>BufferPin<cr>";
        options = {
          silent = true;
          desc = "Pin Buffer";
        };
      }
      {
        key = "<leader>br";
        mode = ["n"];
        action = "<cmd>BufferRestore<cr>";
        options = {
          silent = true;
          desc = "Restore Buffer";
        };
      }
      {
        key = "<leader>bc";
        mode = ["n"];
        action = "<cmd>BufferCloseAllButCurrent<cr>";
        options = {
          silent = true;
          desc = "Close all Buffers except Current";
        };
      }
      {
        key = "<leader>bC";
        mode = ["n"];
        action = "<cmd>BufferWipeout<cr>";
        options = {
          silent = true;
          desc = "Close all Buffers";
        };
      }
      {
        key = "<leader>bd";
        mode = ["n"];
        action = "<cmd>BufferPickDelete<cr>";
        options = {
          silent = true;
          desc = "Pick Buffer to Close";
        };
      }
      {
        key = "<leader>c";
        mode = ["n"];
        action = "<cmd>BufferClose<cr>";
        options = {
          silent = true;
          desc = "Close Buffer";
        };
      }
    ];
  };
}

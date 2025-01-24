{...}: {
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
        extensions = [
          "fzf"
          "neo-tree"
        ];
        disabledFiletypes = {
          statusline = [
            "NvimTree"
            "NeoTree"
            "lspsagaoutline"
            "neo-tree"
            "sagaoutline"
          ];
          winbar = [
            "NvimTree"
            "NeoTree"
            "lspsagaoutline"
            "neo-tree"
            "sagaoutline"
          ];
        };
        options = {
          theme = {
            normal = {
              a = {
                bg = "NONE";
              };
              b = {
                bg = "NONE";
              };
              c = {
                bg = "NONE";
              };
              z = {
                bg = "NONE";
              };
              y = {
                bg = "NONE";
              };
            };
          };
        };
        #theme = "iceberg_dark";
        component_separators = "";
        section_separators = "";
      };
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "";
            # NOTE: Keep all the 'status' just in case, I will add icons for each one I use often
            fmt = ''
              function()
                local mode_map = {
                  ['n']    = '', -- NORMAL
                  ['no']   = 'O-PENDING',
                  ['nov']  = 'O-PENDING',
                  ['noV']  = 'O-PENDING',
                  ['no\22'] = 'O-PENDING',
                  ['niI']  = 'NORMAL',
                  ['niR']  = 'NORMAL',
                  ['niV']  = 'NORMAL',
                  ['nt']   = 'NORMAL',
                  ['v']    = '', -- VISUAL
                  ['vs']   = '', -- VISUAL
                  ['V']    = '', --V-LINE
                  ['Vs']   = 'V-LINE',
                  ['\22']   = '', -- V-BLOCK
                  ['\22s']  = 'V-BLOCK',
                  ['s']    = 'SELECT',
                  ['S']    = 'S-LINE',
                  ['\19']   = 'S-BLOCK',
                  ['i']    = '', -- INSERT
                  ['ic']   = 'INSERT',
                  ['ix']   = 'INSERT',
                  ['R']    = 'REPLACE',
                  ['Rc']   = 'REPLACE',
                  ['Rx']   = 'REPLACE',
                  ['Rv']   = 'V-REPLACE',
                  ['Rvc']  = 'V-REPLACE',
                  ['Rvx']  = 'V-REPLACE',
                  ['c']    = '', --COMMAND
                  ['cv']   = 'EX',
                  ['ce']   = 'EX',
                  ['r']    = 'REPLACE',
                  ['rm']   = 'MORE',
                  ['r?']   = 'CONFIRM',
                  ['!']    = '', -- SHELL
                  ['t']    = '󱆃', -- TERMINAL
                }
                local mode = vim.api.nvim_get_mode().mode
                return mode_map[mode] or "__"
              end
            '';
            separator = "";
            padding = {
              left = 1;
              right = 1;
            };
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
          {
            __unkeyed-1 = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
        ];
        lualine_c = [
          {
            __unkeyed-1 = "diagnostics";
            sources = ["nvim_lsp"];
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
          }
          {
            __unkeyed-1 = "navic";
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = "filetype";
            icon_only = true;
            separator = "";
            padding = {
              left = 1;
              right = 0;
            };
          }
          {
            __unkeyed-1 = "filename";
            path = 1;
            bg = "NONE";
          }
        ];
        lualine_y = [
          {
            __unkeyed-1 = "progress";
          }
        ];
        lualine_z = [
          {
            __unkeyed-1 = "location";
          }
        ];
      };
    };
  };
}

_: {
  plugins.lualine = {
    enable = true;
    # iconsEnabled = true;
    # theme.__raw = ''getTheme(require(" catppuccin.palettes ").get_palette())'';
    # sections = {
    #   lualine_a = [ ];
    #   lualine_b = [ ];
    #   lualine_c = [ ];
    #   lualine_x = [
    #     # component.vim_mode
    #     {
    #       name = "mode";
    #       fmt = ''
    #         function(str)
    #           return str:sub(1, 1):upper()
    #          end
    #       '';
    #       color = { gui = "bold"; };
    #     }
    #     # component.filetype
    #     {
    #       name = "filetype";
    #       colored = true;
    #       icon = { align = "left"; };
    #       fmt = ''
    #         function(str)
    #             return str:upper()
    #         end
    #       '';
    #       color.__raw = ''
    #         function()
    #             local clrs = require("catppuccin.palettes").get_palette()
    #             return {fg = clrs.text, bg = clrs.surface0}
    #         end
    #       '';
    #     }
    #     # component.lsp
    #     {
    #       name.__raw = ''
    #         function()
    #             if not rawget(vim, "lsp") then
    #                 return ""
    #             end
    #
    #             local progress = vim.lsp.util.get_progress_messages()[1]
    #             -- if vim.o.columns < 120 then
    #             --     return ""
    #             -- end
    #
    #             local clients = vim.lsp.get_active_clients({bufnr = 0})
    #             if #clients ~= 0 then
    #                 if progress then
    #                     local spinners = {"◜ ", "◠ ", "◝ ", "◞ ", "◡ ", "◟ "}
    #                     local ms = vim.loop.hrtime() / 1000000
    #                     local frame = math.floor(ms / 120) % #spinners
    #                     local content = string.format("%%<%s", spinners[frame + 1])
    #                     return content
    #                 else
    #                     return "לּ LSP"
    #                 end
    #             end
    #             return ""
    #         end
    #       '';
    #       color.__raw = ''
    #         function()
    #             local clrs = require("catppuccin.palettes").get_palette()
    #             return {
    #                 fg = vim.lsp.util.get_progress_messages()[1] and clrs.yellow or clrs.green,
    #                 bg = clrs.surface0,
    #                 gui = "bold"
    #             }
    #         end
    #       '';
    #     }
    #   ];
    #   lualine_y = [
    #     # component.git_branch
    #     {
    #       name = "branch";
    #       icon = [ "" ];
    #       color.__raw = ''
    #         function(section)
    #             local clrs = require("catppuccin.palettes").get_palette()
    #             return {fg = clrs.text, bg = clrs.mantle, gui = "bold"}
    #         end
    #       '';
    #       separator = {
    #         left = "█";
    #         right = "";
    #       };
    #     }
    #     # component.git_diff
    #     {
    #       name = "diff";
    #       colored = true;
    #       diff_color = {
    #         added = "LuaLineDiffAdd";
    #         modified = "LuaLineDiffChange";
    #         removed = "LuaLineDiffDelete";
    #       };
    #       color.__raw = ''
    #         function()
    #             local clrs = require("catppuccin.palettes").get_palette()
    #             return {bg = clrs.mantle}
    #         end
    #       '';
    #       symbols = {
    #         added = " ";
    #         modified = " ";
    #         removed = " ";
    #       };
    #     }
    #     # component.diagnostics
    #     {
    #       name = "diagnostics";
    #       sources = [ "nvim_lsp" "nvim_diagnostic" "nvim_workspace_diagnostic" "vim_lsp" ];
    #       sections = [ "error" "warn" "hint" "info" ];
    #       diagnostics_color = {
    #         error = "DiagnosticError";
    #         warn = "DiagnosticWarn";
    #         hint = "DiagnosticHint";
    #         info = "DiagnosticInfo";
    #       };
    #       color = ''
    #         function()
    #             local clrs = require("catppuccin.palettes").get_palette()
    #             return {bg = clrs.mantle}
    #         end
    #       '';
    #       colored = true;
    #     }
    #   ];
    #   lualine_z = [
    #     {
    #       name.__raw = ''
    #         function()
    #             local chars = {
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " ",
    #                 " "
    #             }
    #             local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
    #             local position = math.floor(line_ratio * 100)
    #
    #             if position <= 5 then
    #                 position = " TOP"
    #             elseif position >= 95 then
    #                 position = " BOT"
    #             else
    #                 position = chars[math.floor(line_ratio * #chars)] .. position
    #             end
    #             return position
    #         end
    #       '';
    #       color.__raw = ''
    #         function()
    #             local clrs = require("catppuccin.palettes").get_palette()
    #             local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
    #             local fg
    #             local gui
    #
    #             if position <= 5 then
    #                 fg = clrs.sapphire
    #                 gui = "bold"
    #             elseif position >= 95 then
    #                 fg = clrs.red
    #                 gui = "bold"
    #             else
    #                 fg = clrs.mauve
    #                 gui = nil
    #             end
    #             return {
    #                 fg = fg,
    #                 gui = gui,
    #                 bg = clrs.mantle
    #             }
    #         end
    #       '';
    #       separator = {
    #         left = "█";
    #         right = "█";
    #       };
    #     }
    #   ];
    # };
  };
  # extraConfigLuaPre = ''
  #   function getTheme(clrs)
  #       return {
  #           normal = {
  #               a = {fg = "NONE", bg = "NONE"},
  #               b = {fg = "NONE", bg = "NONE"},
  #               c = {fg = "NONE", bg = "NONE"},
  #               x = {fg = clrs.mantle, bg = clrs.green}
  #           },
  #           insert = {
  #               a = {fg = "NONE", bg = "NONE"},
  #               b = {fg = "NONE", bg = "NONE"},
  #               c = {fg = "NONE", bg = "NONE"},
  #               x = {fg = clrs.mantle, bg = clrs.sapphire}
  #           },
  #           visual = {
  #               a = {fg = "NONE", bg = "NONE"},
  #               b = {fg = "NONE", bg = "NONE"},
  #               c = {fg = "NONE", bg = "NONE"},
  #               x = {fg = clrs.mantle, bg = clrs.yellow}
  #           },
  #           replace = {
  #               a = {fg = "NONE", bg = "NONE"},
  #               b = {fg = "NONE", bg = "NONE"},
  #               c = {fg = "NONE", bg = "NONE"},
  #               x = {fg = clrs.mantle, bg = clrs.mauve}
  #           },
  #           command = {
  #               a = {fg = "NONE", bg = "NONE"},
  #               b = {fg = "NONE", bg = "NONE"},
  #               c = {fg = "NONE", bg = "NONE"},
  #               x = {fg = clrs.mantle, bg = clrs.blue}
  #           },
  #           terminal = {
  #               a = {fg = "NONE", bg = "NONE"},
  #               b = {fg = "NONE", bg = "NONE"},
  #               c = {fg = "NONE", bg = "NONE"},
  #               x = {fg = clrs.mantle, bg = clrs.teal}
  #           }
  #       }
  #   end
  # '';
  extraConfigLuaPost = ''
    function getComponents(clrs)
        local present, feline = pcall(require, "lualine")

        if not present then
            return
        end

        local component = {}

        component.vim_mode = {
            "mode",
            fmt = function(str)
                return str:sub(1, 1):upper()
            end,
            color = {gui = "bold"}
        }

        component.git_branch = {
            "branch",
            icon = {""},
            color = function(section)
                local clrs = require("catppuccin.palettes").get_palette()
                return {fg = clrs.text, bg = clrs.mantle, gui = "bold"}
            end,
            separator = {left = "█", right = ""}
        }

        component.git_diff = {
            "diff",
            colored = true,
            diff_color = {
                added = {fg = clrs.green},
                modified = {fg = clrs.mauve},
                removed = {fg = clrs.red}
            },
            color = function()
                local clrs = require("catppuccin.palettes").get_palette()
                return {bg = clrs.mantle}
            end,
            symbols = {added = " ", modified = " ", removed = " "}
        }

        component.diagnostics = {
            "diagnostics",
            sources = {"nvim_lsp", "nvim_diagnostic", "nvim_workspace_diagnostic", "vim_lsp"},
            sections = {"error", "warn", "hint", "info"},
            diagnostics_color = {
                info = {fg = clrs.blue}
            },
            symbols = {error = " ", warn = " ", info = " ", hint = " "},
            color = function()
                local clrs = require("catppuccin.palettes").get_palette()
                return {bg = clrs.mantle}
            end,
            colored = true
        }

        component.lsp = {
            function()
                if not rawget(vim, "lsp") then
                    return ""
                end

                local progress = vim.lsp.util.get_progress_messages()[1]

                local clients = vim.lsp.get_active_clients({bufnr = 0})
                if #clients ~= 0 then
                    if progress then
                        local spinners = {"◜ ", "◠ ", "◝ ", "◞ ", "◡ ", "◟ "}
                        local ms = vim.loop.hrtime() / 1000000
                        local frame = math.floor(ms / 120) % #spinners
                        local content = string.format("%%<%s", spinners[frame + 1])
                        return content
                    else
                        return "לּ LSP"
                    end
                end
                return ""
            end,
            color = function()
                local clrs = require("catppuccin.palettes").get_palette()
                return {
                    fg = vim.lsp.util.get_progress_messages()[1] and clrs.yellow or clrs.green,
                    bg = clrs.surface0,
                    gui = "bold"
                }
            end,
        }

        component.file_type = {
            "filetype",
            colored = true,
            icon = {align = "left"},
            fmt = function(str)
                return str:upper()
            end,
            color = function()
                local clrs = require("catppuccin.palettes").get_palette()
                return {fg = clrs.text, bg = clrs.surface0}
            end,
        }

        component.scroll_bar = {
            function()
                local chars = {
                    " ", " ", " ", " ",
                    " ", " ", " ", " ",
                    " ", " ", " ", " ",
                    " ", " ", " ", " ",
                    " ", " ", " ", " ",
                    " ", " ", " ", " ",
                    " ", " ", " ", " "
                }
                local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
                local position = math.floor(line_ratio * 100)

                if position <= 5 then
                    position = " TOP"
                elseif position >= 95 then
                    position = " BOT"
                else
                    position = chars[math.floor(line_ratio * #chars)] .. position
                end
                return position
            end,
            color = function()
                local clrs = require("catppuccin.palettes").get_palette()
                local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
                local fg
                local gui

                if position <= 5 then
                    fg = clrs.sapphire
                    gui = "bold"
                elseif position >= 95 then
                    fg = clrs.red
                    gui = "bold"
                else
                    fg = clrs.mauve
                    gui = nil
                end
                return {
                    fg = fg,
                    gui = gui,
                    bg = clrs.mantle
                }
            end,
            separator = {left = "█", right = "█"}
        }

        local lualine_x = {
            component.vim_mode,
            component.file_type,
            component.lsp
        }
        local lualine_y = {
            component.git_branch,
            component.git_diff,
            component.diagnostics
        }
        local lualine_z = {
            component.scroll_bar
        }

        return {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = lualine_x,
            lualine_y = lualine_y,
            lualine_z = lualine_z
        }
    end

    function getTheme(clrs)
        return {
            normal = {
                a = {fg = "NONE", bg = "NONE"},
                b = {fg = "NONE", bg = "NONE"},
                c = {fg = "NONE", bg = "NONE"},
                x = {fg = clrs.mantle, bg = clrs.green}
            },
            insert = {
                a = {fg = "NONE", bg = "NONE"},
                b = {fg = "NONE", bg = "NONE"},
                c = {fg = "NONE", bg = "NONE"},
                x = {fg = clrs.mantle, bg = clrs.sapphire}
            },
            visual = {
                a = {fg = "NONE", bg = "NONE"},
                b = {fg = "NONE", bg = "NONE"},
                c = {fg = "NONE", bg = "NONE"},
                x = {fg = clrs.mantle, bg = clrs.yellow}
            },
            replace = {
                a = {fg = "NONE", bg = "NONE"},
                b = {fg = "NONE", bg = "NONE"},
                c = {fg = "NONE", bg = "NONE"},
                x = {fg = clrs.mantle, bg = clrs.mauve}
            },
            command = {
                a = {fg = "NONE", bg = "NONE"},
                b = {fg = "NONE", bg = "NONE"},
                c = {fg = "NONE", bg = "NONE"},
                x = {fg = clrs.mantle, bg = clrs.blue}
            },
            terminal = {
                a = {fg = "NONE", bg = "NONE"},
                b = {fg = "NONE", bg = "NONE"},
                c = {fg = "NONE", bg = "NONE"},
                x = {fg = clrs.mantle, bg = clrs.teal}
            }
        }
    end

    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = getTheme(require("catppuccin.palettes").get_palette()),
        },
        sections = getComponents(require("catppuccin.palettes").get_palette()),
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        }
    }

    -- TODO: This doesn't seem to work. Fix this.
    vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        require('lualine').refresh()
    end,
    })
  '';
}

{
  plugins = {
    lspsaga = {
      enable = true;
      settings = {
        beacon.enable = true;
        symbol_in_winbar = {
          enable = true; # Breadcrumbs
          show_file = false;
        };

        lightbulb = {
          enable = false;
          sign = false;
        };

        outline = {
          auto_preview = false;
          close_after_jump = true;
          auto_close = true;
          layout = "normal"; # normal or float
          win_position = "right"; # left or right
          keys = {
            jump = "e";
            quit = "q";
            toggle_or_jump = "o";
          };
        };

        scroll_preview = {
          scroll_up = "<C-d>";
          scroll_down = "<C-u>";
        };
      };
    };
  };
}

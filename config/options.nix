{
  config = {
    viAlias = true;
    vimAlias = true;

    opts = {
      updatetime = 100;
      number = true;
      relativenumber = true;

      autoindent = true;
      autowrite = true;
      confirm = true;
      clipboard = "unnamedplus";
      cursorline = true;
      list = true;
      expandtab = true;
      shiftround = true;
      shiftwidth = 2;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      tabstop = 2;

      ignorecase = true;
      incsearch = true;
      completeopt = "menu,menuone,noselect";
      wildmode = "longest:full,full";

      swapfile = false;
      undofile = true;
      undolevels = 10000;
    };
    clipboard.providers.wl-copy.enable = true;
    extraConfigLua = ''
            vim.opt.mouse=""
            -- Enable keybind to back to Normal mode from terminal
            vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
            -- Open a terminal in a new tab
            vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnew | terminal<CR>', { noremap = true, silent = true })
            -- set modifiable on
            vim.cmd([[
        augroup TerminalSettings
          autocmd!
          autocmd TermOpen * setlocal modifiable
        augroup END
      ]])

    '';
  };
}

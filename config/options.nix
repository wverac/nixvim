{pkgs, ...}: {
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
    # Only enable wl-copy on Linux systems
    clipboard.providers.wl-copy.enable = pkgs.stdenv.isLinux;
    extraConfigLua = ''
      vim.opt.mouse=""

    '';
  };
}

{ pkgs, ... }:
{
  imports = [
    ./lsp
    ./telescope
    ./which-key
    ./ui
  ];

  config = {
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        term_colors = true;
        no_italic = false;
        no_bold = false;
        settings.integrations = {
          barbecue = {
            dim_dirname = true;
            bold_basename = true;
            dim_context = false;
            alt_background = false;
          };
        };
      };
    };
    luaLoader.enable = true;
    plugins = {
      treesitter = {
        enable = true;
        ensureInstalled = [
          "go"
          "rust"
          "nix"
          "lua"
          "haskell"
          "java"
          "html"
          "astro"
          "javascript"
          "typescript"
          "tsx"
          "json"
          "json5"
          "lua"
          "markdown"
          "markdown_inline"
        ];
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          go
          rust
          nix
          lua
          haskell
          java
          html
          astro
          javascript
          typescript
          tsx
          json
          json5
          markdown
          markdown-inline
          vim
          regex
          bash
          html
        ];
        folding = true;
        indent = true;
        nixGrammars = true;
        nixvimInjections = true;
      };
      vim-matchup = {
        enable = true;
        treesitterIntegration.enable = true;
      };
      ts-autotag.enable = true;
      project-nvim.enable = true;
      auto-session.enable = true;
      barbecue = {
        enable = true;
        theme = "catppuccin";
      };
    };
    globals.mapleader = " "; # Sets the leader key to space
    opts = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      guifont = "Iosevka Nerd Font Mono:h8";
      clipboard = "unnamedplus";
      timeout = true;
      timeoutlen = 300;
      smarttab = true;
      foldenable = true;
      foldcolumn = "1";
      fillchars = {
        eob = " ";
        fold = " ";
        foldopen = "";
        foldsep = " ";
        foldclose = "";
      };
      foldlevel = 99;
      foldlevelstart = 99;
      tabstop = 2;
      shiftwidth = 2;
      autoindent = true;
      cindent = true;
      smartindent = true;
      smartcase = true;
      ignorecase = true;
      infercase = true;
      showmode = false;
      ruler = false;
      showcmd = false;
      breakindent = true;
      copyindent = true;
      cursorline = true;
      expandtab = true;
      preserveindent = true;
      pumheight = 10;
      undofile = true;
      virtualedit = "block";
      wrap = false;
      titlestring = "neovim";
      title = true;
      splitbelow = true;
      splitright = true;
    };
  };
}

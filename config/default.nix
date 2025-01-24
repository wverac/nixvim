{pkgs, ...}: {
  imports = [
    ./themes/catppuccin.nix
    ./plugs/lsp.nix
    ./plugs/ui.nix
    ./plugs/cmp.nix
    ./options.nix
    ./keymaps.nix
    ./plugs/alpha.nix
    ./plugs/lspsaga.nix
    ./plugs/lualine.nix
  ];
  # globals.mapleader = " "; # defined in keymaps module
  extraPackages = with pkgs; [
    wl-clipboard
    xdg-utils
    # Required by telescope live grep
    ripgrep
    # Required by CMP
    alejandra
    nixpkgs-fmt
    prettierd
    nixfmt-classic
    stylua
    python312Packages.flake8
    prettierd
    vimPlugins.vim-prettier
    python312Packages.autopep8
    yapf
    black
    isort
    hadolint
    rubyfmt
    shfmt
  ];
}

{ pkgs, ... }: {
  imports = [
    ./theme.nix
    ./plugs/lsp.nix
    ./plugs/ui.nix
    ./plugs/cmp.nix
    ./options.nix
    ./keymaps.nix
    ./plugs/alpha.nix
  ];
  # globals.mapleader = " "; # defined in keymaps module
  extraPackages = with pkgs; [
    # Required by telescope live grep
    ripgrep
    # Required by CMP
    alejandra
    nixpkgs-fmt
    prettierd
    nixfmt-classic
    stylua
  ];
}

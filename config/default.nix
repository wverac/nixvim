{
  pkgs,
  system,
  ...
}: let
  # Helper to determine if we're on Darwin
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
  treeSitterCli = pkgs.rustPlatform.buildRustPackage rec {
    pname = "tree-sitter-cli";
    version = "0.26.1";
    src = pkgs.fetchFromGitHub {
      owner = "tree-sitter";
      repo = "tree-sitter";
      rev = "v${version}";
      hash = "sha256-k8X2qtxUne8C6znYAKeb4zoBf+vffmcJZQHUmBvsilA=";
    };
    cargoHash = "sha256-hnFHYQ8xPNFqic1UYygiLBWu3n82IkTJuQvgcXcMdv0=";
    cargoBuildFlags = [
      "-p"
      "tree-sitter-cli"
    ];
    buildInputs =
      if isLinux then [pkgs.stdenv.cc.libc.dev]
      else [];
    nativeBuildInputs = [pkgs.llvmPackages.libclang];
    LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
    BINDGEN_EXTRA_CLANG_ARGS =
      if isLinux then "-isystem ${pkgs.stdenv.cc.libc.dev}/include"
      else "";
    doCheck = false;
  };

  # Common packages for all systems
  commonPackages = with pkgs; [
    # Required by telescope
    ripgrep
    fd
    # Required by treesitter and lspsaga
    treeSitterCli
    # Required by CMP and formatters
    alejandra
    nixpkgs-fmt
    prettierd
    nixfmt
    stylua
    python312Packages.flake8
    vimPlugins.vim-prettier
    python312Packages.autopep8
    yapf
    black
    isort
    hadolint
    #rubyfmt
    shfmt
  ];

  # Linux-specific packages
  linuxPackages = with pkgs; [
    wl-clipboard # Wayland clipboard
    xdg-utils
  ];

  # Darwin-specific packages
  darwinPackages = with pkgs; [
    # macOS uses pbcopy/pbpaste for clipboard, which is built-in
  ];
in {
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

  extraPackages =
    commonPackages
    ++ (
      if isLinux
      then linuxPackages
      else []
    )
    ++ (
      if isDarwin
      then darwinPackages
      else []
    );
}

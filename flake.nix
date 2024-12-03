{
  description = "Neovim Config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    unstable,
    nixvim,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      module = {imports = [./config];};
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (final: _: let
            inherit (final) system;
          in {
            unstable = import unstable {
              system = "${system}";
              config.allowUnfree = true;
            };
          })
        ];
        config.allowUnfree = true;
      };
      nixvim' = nixvim.legacyPackages."${system}";
      nvim = nixvim'.makeNixvimWithModule {inherit module pkgs;};
    in {
      packages = {
        inherit nvim;
        default = nvim;
      };
    });
}

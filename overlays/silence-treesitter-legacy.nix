# Shim `nvim-treesitter-legacy` to silence the deprecation warning triggered
# by nixpkgs' vim-utils sanity check, which instantiates the attribute even
# when only the new `nvim-treesitter` is in use.
_: prev: {
  vimPlugins = prev.vimPlugins.extend (_: vPrev: {
    nvim-treesitter-legacy = vPrev.nvim-treesitter.overrideAttrs (_: {
      pname = "nvim-treesitter-legacy-shim";
    });
  });
}

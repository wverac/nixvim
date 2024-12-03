_: {
  config.plugins.none-ls = {
    enable = true;
    cmd = ["bash -c nvim"];
    debug = true;
    sources = {
      code_actions = {
        statix.enable = true;
      };
      diagnostics = {
        statix.enable = true;
        deadnix.enable = true;
        # mypy = {
        #   enable = true;
        #   withArgs = ''
        #     ({
        #         extra_args = function()
        #         local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
        #         return { "--python-executable", virtual .. "/bin/python3" }
        #         end,
        #     })
        #   '';
        # };
        # pylint.enable = true;
      };
      formatting = {
        alejandra.enable = true;
        stylua.enable = true;
        shfmt.enable = true;
        nixpkgs_fmt.enable = true;
        # prettier.enable = true;
        # prettier.disableTsServerFormatter = true;
        # biome.enable = true;
        # black.enable = true;
      };
    };
  };
}

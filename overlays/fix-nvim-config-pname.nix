# Add `pname` to nixvim's internal `nvim-config` plugin (built via
# `runCommandLocal "nvim-config"`). Required because nixpkgs' vim-utils
# sanity check now maps `.pname` over every plugin in the pack dir
# (replacing the previous reference-equality check), and nixvim does not
# yet set `pname` on this internal derivation.
_: prev: {
  runCommandLocal = name: env:
    prev.runCommandLocal name (
      if name == "nvim-config" && !(env ? pname)
      then env // {pname = "nvim-config";}
      else env
    );
}

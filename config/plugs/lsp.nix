{...}: {
  plugins.lsp = {
    enable = true;
    servers = {
      lua_ls.enable = true; #Lua
      cssls.enable = true; # CSS
      html.enable = true; # HTML
      pyright.enable = true; # Python
      marksman.enable = true; # Markdown
      nil_ls.enable = true; # Nix
      dockerls.enable = true; # Docker
      bashls.enable = true; # Bash
      yamlls.enable = true; # YAML
      terraformls.enable = true; # Terraform
    };
  };
  plugins.cmp = {
    autoEnableSources = true;
    settings.sources = [
      {name = "nvim_lsp";}
      {name = "path";}
      {name = "buffer";}
    ];
  };
  # Linting
  plugins.lint = {
    enable = true;
    lintersByFt = {
      text = ["vale"];
      json = ["jsonlint"];
      markdown = ["vale"];
      rst = ["vale"];
      ruby = ["ruby"];
      janet = ["janet"];
      inko = ["inko"];
      clojure = ["clj-kondo"];
      dockerfile = ["hadolint"];
      terraform = ["tflint"];
    };
  };

  plugins.markdown-preview = {
    enable = true;
    settings.theme = "dark";
  };
  plugins.render-markdown.enable = true;
}

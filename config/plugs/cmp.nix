{
  plugins = {
    lspkind.enable = true;

    cmp-nvim-lsp-signature-help.enable = true;
    cmp = {
      enable = true;
      settings.sources = [
        {name = "nvim_lsp";}
        {name = "nvim_lsp_signature_help";}
        {name = "path";}
        {name = "buffer";}
        {name = "snippy";}
        {name = "luasnip";}
        {name = "cmp-dap";}
      ];
      settings.mapping = {
        "<Tab>" = "cmp.mapping.select_next_item()";
        "<S-Tab>" = "cmp.mapping.select_prev_item()";
        "<C-j>" = "cmp.mapping.scroll_docs(4)";
        "<C-k>" = "cmp.mapping.scroll_docs(-4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-Esc>" = "cmp.mapping.close()";
        "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
        "<Up>" = "cmp.mapping.select_prev_item()";
        "<Down>" = "cmp.mapping.select_next_item()";
        "<Left>" = "cmp.mapping.close()";
        "<Right>" = "cmp.mapping.confirm({ select = true })";
      };
    };
    lsp-format.enable = true;
    none-ls = {
      enable = true;
      enableLspFormat = true;
      sources.formatting = {
        alejandra.enable = true;
        nixpkgs_fmt.enable = true;
        prettier.enable = true;
        prettierd.enable = true;
        stylua.enable = true;
      };
    };
  };

  extraConfigLua = ''
    local cmp_enabled = true
    vim.api.nvim_create_user_command("ToggleAutoComplete", function()
      if cmp_enabled then
        require("cmp").setup.buffer({ enabled = false })
        require("notify")("Disabled Autocomplete", "info")
        cmp_enabled = false
      else
        require("cmp").setup.buffer({ enabled = true })
        require("notify")("Enabled Autocomplete", "info")
        cmp_enabled = true
      end
    end, {})
  '';

  keymaps = [
    {
      key = "<Leader>na";
      action = "<cmd> ToggleAutoComplete <CR>";
      mode = "n";
      options.desc = "Toggle CMP Autocomplete";
    }
  ];
}

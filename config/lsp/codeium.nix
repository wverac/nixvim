{pkgs, ...}: {
  config = {
    extraPlugins = with pkgs.vimPlugins; [codeium-vim];
    keymaps = [
      {
        key = "<C-cr>";
        action = "codeium#Accept";
        mode = ["i"];
        options = {
          expr = true;
          nowait = true;
          silent = true;
          script = true;
        };
      }

      {
        key = "<C-;>";
        action = "<cmd>call codeium#CycleCompletions(1)<cr>";
        mode = ["i"];
      }
      {
        key = "<C-,>";
        action = "<cmd>call codeium#CycleCompletions(-1)<cr>";
        mode = ["i"];
      }
      {
        key = "<C-x>";
        action = "<cmd>call codeium#Clear()<cr>";
        mode = ["i"];
      }
    ];
  };
}

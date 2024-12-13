{
  plugins = {
    lspsaga = {
      enable = true;
      beacon.enable = true;
      symbolInWinbar = {
        enable = true; # Breadcrumbs
        showFile = false;
      };

      lightbulb = {
        enable = false;
        sign = false;
      };

      outline = {
        autoPreview = false;
        closeAfterJump = true;
        autoClose = true;
        layout = "normal"; # normal or float
        winPosition = "right"; # left or right
        keys = {
          jump = "e";
          quit = "q";
          toggleOrJump = "o";
        };
      };

      scrollPreview = {
        scrollUp = "<C-d>";
        scrollDown = "<C-u>";
      };
    };
  };
}

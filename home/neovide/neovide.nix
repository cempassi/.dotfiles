{
  config,
  pkgs,
  ...
}: {
  programs.neovide = {
    enable = true;

    settings = {
      font = {
        normal = [
          {
            family = "Hasklug Nerd Font Mono";
            style = "ExtraLight";
          }
        ];
        bold = [
          {
            family = "Hasklug Nerd Font Mono";
            style = "Normal";
          }
        ];
        size = 14.0;
      };
    };
  };
}

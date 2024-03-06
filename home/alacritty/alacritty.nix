{
  config,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        pkgs.alacritty-theme.nord
      ];

      font = {
        normal = {
          family = "Hasklug Nerd Font Mono";
          style = "Light";
        };
        bold = {
          family = "Hasklug Nerd Font Mono";
          style = "Normal";
        };
        italic = {
          family = "Hasklug Nerd Font Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "Hasklug Nerd Font Mono";
          style = "Bold Italic";
        };

        size = 14;
        offset = {
          x = 1;
          y = 2;
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };
      };

      window = {
        opacity = 1.0;
        padding = {
          x = 0;
          y = 0;
        };
      };

      scrolling = {
        history = 1000;
        multiplier = 10;
      };

      selection = {
        semantic_escape_chars = ",│`|:\"'' ()[]{}<>";
        save_to_clipboard = true;
      };

      live_config_reload = true;
      env = {
        TERM = "xterm-256color";
      };
    };
  };
}

{
  config,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      colors.primary = {
        background = "#0C0C0C";
        foreground = "#F1F5F9";
      };

      colors.normal = {
        black = "#3B4252";
        blue = "#81A1C1";
        green = "#A3BE8C";
        cyan = "#88C0D0";
        red = "#BF616A";
        magenta = "#B48EAD";
        yellow = "#EBCB8B";
        white = "#E5E9F0";
      };

      colors.bright = {
        black = "#4C566A";
        blue = "#81A1C1";
        green = "#A3BE8C";
        cyan = "#8FBCBB";
        red = "#BF616A";
        magenta = "#B48EAD";
        yellow = "#EBCB8B";
        white = "#ECEFF4";
      };

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

        size = 12;
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

      use_thin_strokes = "true";
      key_bindings = [
        {
          key = "F";
          mods = "Command|Control";
          action = "ToggleFullscreen";
        }
        {
          key = "N";
          mods = "Command|Control";
          action = "SpawnNewInstance";
        }
      ];
    };
  };
}

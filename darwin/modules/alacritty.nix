{ vars, ... }:

{
  home-manager.users.${vars.user} = {
    programs.alacritty = {
      enable = true;
      settings = {
        font = {
          normal.family = "JetBrainsMono Nerd Font";
          size = 13;
        };
        window = {
          padding.x = 2;
          padding.y = 2;
          decorations = "Buttonless";
          startup_mode = "Fullscreen";
          option_as_alt = "Both";
        };
        colors = {
          primary = {
            background = "#1f1f1f";
            foreground = "#e6e6e6";

            dim_foreground = "#1f1f1f";
            bright_foreground = "#868686";
          };
          cursor = {
            text = "#1f1f1f";
            cursor = "#e6e6e6";
          };
          normal = {
            black = "#1f1f1f";
            red = "#ee908d";
            green = "#6ebd3f";
            yellow = "#e89921";
            blue = "#71adf6";
            magenta = "#d88bfc";
            cyan = "#00c09b";
            white = "#e6e6e6";
          };
          bright = {
            black = "#333333";
            red = "#ff9ca9";
            green = "#70d286";
            yellow = "#ff9b5e";
            blue = "#b3c5ff";
            magenta = "#ee96e8";
            cyan = "#2ed3ce";
            white = "#fafafa";
          };
          dim = {
            black = "#1f1f1f";
            red = "#cf7d7a";
            green = "#5fa435";
            yellow = "#ca841b";
            blue = "#6196d6";
            magenta = "#bc78db";
            cyan = "#00a786";
            white = "#868686";
          };
        };

      };
    };
  };
}

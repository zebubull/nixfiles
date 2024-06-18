{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      show_hyperlink_targets = true;
      background_opacity = "0.8";

      tab_bar_edge = "top";
      tab_bar_align = "left";
      tab_bar_min_tabs = 2;

      tab_bar_style = "fade";
      tab_activity_symbol = "!";
      tab_title_template = "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{title} {num_windows}";

      # custom theme maybe
      foreground = "#1CD1AB";
      background = "#14171A";
      selection_foreground = "#14171A";
      selection_background = "#1CD1AB";

      # black
      color0 = "#14171A";
      color8 = "#877d81";

      # red
      color1 = "#C84D4F";
      color9 = "#C84D4F";

      # green
      color2 = "#7AE37C";
      color10 = "#7AE37C";

      # yellow
      color3 = "#C7DC82";
      color11 = "#C7DC82";

      # blue
      color4 = "#3ECED6";
      color12 = "#3ECED6";

      # magenta
      color5 = "#BD5BB9";
      color13 = "#BD5BB9";

      # cyan
      color6 = "#1CD1AB";
      color14 = "#1CD1AB";

      # white
      color7 = "#E8FAED";
      color15 = "#E8FAED";
    };
    keybindings = {
      "kitty_mod+t" = "new_tab";
      "ctrl+tab" = "next_tab";
      "ctrl+shift+tab" = "previous_tab";
      "kitty_mod+q" = "close_tab";

      "kitty_mod+<" = "move_tab_backwards";
      "kitty_mod+>" = "move_tab_forwards";
      "kitty_mod+i" = "set_tab_title";

      "kitty_mod+h" = "launch --cwd=current --location=hsplit";
      "kitty_mod+v" = "launch --cwd=current --location=vsplit";
      "kitty_mod+w" = "close_window";
    };
  };
}

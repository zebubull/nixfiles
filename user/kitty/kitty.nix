{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Rosé Pine Moon";
    settings = {
      show_hyperlink_targets = true;
      background_opacity = "0.8";

      tab_bar_edge = "top";
      tab_bar_align = "left";
      tab_bar_min_tabs = 2;

      tab_bar_style = "fade";
      tab_activity_symbol = "!";
      tab_title_template = "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{title} {num_windows}";
    };
    font.name = "JetBrains Mono";
    font.size = 16;
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

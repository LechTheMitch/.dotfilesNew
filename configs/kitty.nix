{ config, pkgs, lib, ... }:

{
  programs.kitty = {
      enable = true;
      package = pkgs.kitty;
      font.name = "Fira Code SemiBold";
      settings = {
        font_size = 16;
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        background_opacity = "0.7";
        background_blur = 32;
        confirm_os_window_close = 0;
        scrollback_lines = 9001;
        wheel_scroll_min_lines = 1;
        enable_audio_bell = false;
        selection_foreground = "none";
        selection_background = "none";
        window_padding_width = 4;
      };
      themeFile = "1984_dark";
    };
}
{ config, pkgs, lib, ... }:

{
  home.username = "gamal";
  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  programs.java.enable = true;
  programs = {
    # Zsh Configuration
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        darwinupdate = "sudo darwin-rebuild switch --flake ~/.dotfiles/";
      };
      initContent = ''
        ${pkgs.fastfetch}/bin/fastfetch
      '';
      history.size = 10000;
      # history.path = "${config.xdg.dataHome}/Clutter/.zsh/history";
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };

    # Kitty Configuration
    kitty = {
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
     # FastFetch Configuration
  fastfetch={
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      logo = {
    padding = {
      top = 1;
      left= 1;
    };
        };
        display = {
          separator = " 󰑃  ";
        };
        modules = [
        "break"
              {
                type = "os";
                key = " DISTRO";
                keyColor = "yellow";
              }
              {
                type = "kernel";
                key = "│ ├󰏖";
                keyColor = "yellow";
              }
              {
                type = "packages";
                key = "│ ├󰏖";
                keyColor = "yellow";
              }
              {
                type = "shell";
                key = "│ └";
                keyColor = "yellow";
              }
              {
                type = "wm";
                key = " DE/WM";
                keyColor = "blue";
              }
              {
                type = "wmtheme";
                key = "│ ├";
                keyColor = "blue";
              }
              {
          type= "icons";
          key= "│ ├󰀻";
          keyColor= "blue";
          }
          {
              type= "cursor";
              key= "│ ├";
              keyColor= "blue";
          }
          {
              type= "terminalfont";
              key= "│ ├";
              keyColor= "blue";
          }
          {
          type= "terminal";
          key= "│ └";
          keyColor= "blue";
          }
          {
          type= "host";
          key= "󰌢 SYSTEM";
          keyColor= "green";
          }
          {
          type = "cpu";
          key = "│ ├󰻠";
          keyColor = "green";
          }
          {
          type= "gpu";
          key= "│ ├󰻑";
          format= "{2}";
          keyColor= "green";
          }
          {
          type= "display";
          key= "│ ├󰍹";
          keyColor= "green";
          compactType= "original-with-refresh-rate";
          }
          {
          type= "memory";
          key= "│ ├󰾆";
          keyColor= "green";
          }
          {
          type= "swap";
          key= "│ ├󰓡";
          keyColor= "green";
          }
          {
          type= "uptime";
          key= "│ ├󰅐";
          keyColor= "green";
          }
          {
          type= "display";
          key= "│ └󰍹";
          keyColor= "green";
          }
          {
          type= "sound";
          key= " AUDIO";
          format= "{2}";
          keyColor= "magenta";
          }
          {
          type= "player";
          key= "│ ├󰥠";
          keyColor = "magenta";
          }
          {
          type= "media";
          key = "│ └󰝚";
          keyColor = "magenta";
          }
          {
          type = "custom";
        format = "{#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}  {#38}  {#39}  {#39}    {#38}  {#37}  {#36}  {#35}  {#34}  {#33}  {#32}  {#31}  {#90}";}
          "break"
            ];
      };
   };
  #Zoxide cd replacement
  zoxide = {
       enable = true;
    enableZshIntegration = true;
  };
  };
}

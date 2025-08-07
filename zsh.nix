programs.zsh.enable = true;
      programs.zsh.enableCompletion = true;
      programs.zsh.autosuggestion.enable = true;
      programs.zsh.syntaxHighlighting.enable = true;
      programs.zsh.shellAliases = {
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        darwinupdate = "sudo darwin-rebuild switch --flake ~/.dotfiles/";
      };
      programs.zsh.initContent = ''
        ${pkgs.fastfetch}/bin/fastfetch
      '';
      programs.zsh.history.size = 10000;
      # programs.zsh.history.path = "${config.xdg.dataHome}/Clutter/.zsh/history";
      programs.zsh.oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };
  in
  {
    inherit inputs configuration;
  };
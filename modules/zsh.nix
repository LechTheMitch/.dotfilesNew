{ config, pkgs, lib, ... }:

{
  programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        flakeupdate = "nix flake update --flake ~/.dotfiles";
        darwinupdate = "sudo darwin-rebuild switch --flake ~/.dotfiles/";
      };
      initContent = ''
        lazyg() {
          if [ -z "$1" ]; then
            echo "Usage: lazyg \"commit message\""
            return 2
          fi
          git add .
          git commit -m "$1"
          git push
        }
        ${pkgs.fastfetch}/bin/fastfetch
      '';
      history.size = 10000;
      
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
  };
}
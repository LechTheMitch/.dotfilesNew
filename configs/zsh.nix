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
        darwinupdate = "sudo darwin-rebuild switch --flake ~/.dotfiles/";
      };
      initContent = ''
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
{ config, pkgs, lib, ... }:

{
  home.username = "gamal";
  home.stateVersion = "25.05";
  home.homeDirectory = "/Users/gamal";
  home.sessionVariables = {
    EDITOR = "nvim";
    PATH = "/opt/homebrew/opt/node@22/bin:$PATH";
  };

  imports = [
    ./modules/kitty.nix
    ./modules/zsh.nix
    ./modules/fastfetch.nix
    ./modules/git.nix
  ];
  
  programs.home-manager.enable = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}

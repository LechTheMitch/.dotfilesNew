{ config, pkgs, lib, ... }:

{
  home.username = "gamal";
  home.stateVersion = "25.05";
  home.homeDirectory = "/Users/gamal";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ./configs/kitty.nix
    ./configs/zsh.nix
    ./configs/fastfetch.nix
  ];
  
  programs.home-manager.enable = true;
  programs.java.enable = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}

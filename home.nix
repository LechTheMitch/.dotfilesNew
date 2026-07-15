{ config, pkgs, lib, ... }:

{
  home.username = "gamal";
  home.stateVersion = "25.05";
  home.homeDirectory = "/Users/gamal";
  home.sessionPath = [
    "/opt/homebrew/bin"
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  home.sessionVariablesExtra = ''
    export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
    export CODEX_HOME="$XDG_CONFIG_HOME/codex"
    export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
  '';

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

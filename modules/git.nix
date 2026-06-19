{ config, pkgs, lib, ... }:

{
  programs.git = {
    	enable = true;
	    lfs.enable = true;
      settings = {
          user = {
            name = "LechTheMitch";
            email = "104312143+LechTheMitch@users.noreply.github.com";
          };
          init = {
            defaultBranch = "main";
          };
      };
  };
}
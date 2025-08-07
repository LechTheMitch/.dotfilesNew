{ config, pkgs, lib, ... }:

{
  programs.git{
    	enable = true;
	    package = pkgs.gitFull;
	    lfs.enable = true;
      userName  = "LechTheMitch";
      userEmail = "104312143+LechTheMitch@users.noreply.github.com";
  }
}
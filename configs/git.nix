{ config, pkgs, lib, ... }:

{
  programs.git{
    	enable = true;
	    lfs.enable = true;
      userName  = "LechTheMitch";
      userEmail = "104312143+LechTheMitch@users.noreply.github.com";
  }
}
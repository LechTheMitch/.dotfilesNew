{ config, pkgs, lib, ... }:

{
  system.primaryUser = "gamal";

  system.defaults = {
    dock.autohide = true;
    dock.autohide-delay = 0.1;
    dock.autohide-time-modifier = 0.5;
    dock.show-recents = false;
    dock.showhidden = true;
    dock.tilesize = 64;
    dock.magnification = false;
    dock.expose-group-apps = true;
    dock.minimize-to-application = true;
    dock.wvous-tl-corner = 2;
    dock.wvous-tr-corner = 3;
    dock.wvous-br-corner = 4;
    dock.wvous-bl-corner = 11;
    dock.persistent-apps = [
      "/Applications/Zen.app"
      "/Applications/ghostty.app"
      "/Applications/Visual Studio Code.app"
    ];
    loginwindow.GuestEnabled = false;
    finder._FXSortFoldersFirst = true;
    finder.ShowExternalHardDrivesOnDesktop = false;
    finder.FXPreferredViewStyle = "clmv";
    finder.AppleShowAllFiles = false;
    finder.CreateDesktop = true;
    finder.ShowPathbar = true;
    finder.ShowStatusBar = true;
    finder.FXDefaultSearchScope = "SCcf";
    finder.NewWindowTarget = "Home";
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.NSWindowShouldDragOnGesture = true;
    NSGlobalDomain.AppleICUForce24HourTime = true;
    NSGlobalDomain."com.apple.keyboard.fnState" = true;
    NSGlobalDomain.AppleKeyboardUIMode = 2;
    WindowManager.EnableStandardClickToShowDesktop = true;
    WindowManager.HideDesktop = true;
    WindowManager.StandardHideDesktopIcons = true;
    WindowManager.EnableTiledWindowMargins = false;
  };
}

{ config, pkgs, lib, ... }:

{
  homebrew = {
    enable = true;
    brews = [
      "mas"
    ];
    casks = [
      "zen"
      "affinity"
      #"stacher https://stacher.io/"
      #"qlcodec from github"
      #"syntax-highlight"
      "mac-mouse-fix"
      "shottr"
      "obs"
      "camo-studio"
      "raycast"
      "rustdesk"
      "localsend"
      "dockdoor"
      "vorssaint"
      "grandperspective"
      "karabiner-elements"
      "thaw"
      "betterdisplay"
      "utm"
      "parallels"
      "crossover"
      "onlyoffice"
      "protonvpn"
      "google-drive"
      "helium-browser"
      "gimp"
      "iina"
      "kde-connect"
      "dimentium/autoraise/autoraiseapp"

      #Dev
      "orbstack"
      "bruno"
      "zed"
      "ghostty"
      "copilot-cli"
      "cursor"
      "codex"
      "antigravity-cli"
      "visual-studio-code"
      "jetbrains-toolbox"
      "intellij-idea"
      "webstorm"
      "clion"
      "pycharm"
      "android-studio"
      "mysqlworkbench"
      "t3-code"
      "zulufx"
      "zulu@21"

      #Children Garbage
      #"roblox"
    ];
    masApps = {
      # "Pages" = 361309726;
      # "Numbers" = 361304891;
      # "Keynote" = 361304891;
      "XCode" = 497799835;
      #"Davinci Resolve" = 571213070;
      "Whatsapp" = 310633997;
      "PDFgear" = 6469021132;
      "The Unarchiver" = 425424353;
      #"Essayist" = 1537845384;
      #"Bitwardin" = 1352778147;

      #Safari Extentions
      "Ghostery" = 6504861501; #Adblock
    };
    taps = [
      "dimentium/autoraise"
    ];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = false;
  };
}

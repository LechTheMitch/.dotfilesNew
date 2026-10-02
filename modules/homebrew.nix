{ config, pkgs, lib, ... }:

{
  homebrew = {
    enable = true;
    brews = [
      "mas"
      "mole"
      "wimlib"
    ];
    casks = [
      "zen"
      "affinity"
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
      "openwhispr"
      "autoraiseapp"
      "harbor"
      "iloader"
      "macusb"
      "clop"
      "forel"

      #Dev
      "orbstack"
      "bruno"
      "zed"
      "ghostty"
      "copilot-cli"
      "codex"
      "antigravity-cli"
      "visual-studio-code"
      "jetbrains-toolbox"
      "intellij-idea"
      "webstorm"
      "clion"
      "rider"
      "pycharm"
      "android-studio"
      "mysqlworkbench"
      "t3-code"
      "zulufx"
      "zulu@21"
      "dotnet-sdk"

      #Children Garbage
      #"roblox"
    ];
    masApps = {
      "XCode" = 497799835;
      #"Davinci Resolve" = 571213070;
      "Whatsapp" = 310633997;
      "PDFgear" = 6469021132;
      "MacPacker" = 6473273874;
      "Bitwardin" = 1352778147;
      "Garageband" = 682658836;
      "Prefab" = 6758208322;

      #Safari Extentions
      "Ghostery" = 6504861501; #Adblock
      "Dark Reader" = 1438243180;
    };
    taps = [
      {
        name = "dimentium/autoraise";
        trusted = true;
      }
      {
        name = "thsnkhn/harbor";
        trusted = true;
      }
      {
        name = "lab421/tap";
        trusted = true;
      }
    ];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = false;
  };
}

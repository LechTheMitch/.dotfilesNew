{
  description = "Example nix-darwin system flake";
  # Note to self, try to install most stuff using brew

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ...}:
  let
    configuration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs;
        [ neovim
          fastfetch
          stow
          wget
          git
          gh
          fzf
          zoxide
          tmux
          btop
          python312
          awscli2
          nodejs
          ffmpeg
          ripgrep
        ];

        fonts.packages = with pkgs; [
          fira-code
          nerd-fonts.jetbrains-mono
          nerd-fonts.fira-code
        ];

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
            "finetune"
            "shottr"
            "obs"
            "camo-studio"
            "raycast"
            #"rustdesk"
            "localsend"
            "dockdoor"
            "appcleaner"
            "grandperspective"
            "karabiner-elements"
            "thaw"
            "betterdisplay"
            "utm"
            "parallels"
            "crossover"
            "protonvpn"
            "google-chrome"
            "helium-browser"
            "gimp"
            "iina"
            "dimentium/autoraise/autoraiseapp"

            #Dev
            "orbstack"
            "bruno"
            "zed"
            "ghostty"
            "copilot-cli"
            "cursor"
            "codex-app"
            "antigravity-cli"
            "visual-studio-code"
            "jetbrains-toolbox"
            "intellij-idea"
            "webstorm"
            "clion"
            "pycharm"
            "android-studio"
            "mysqlworkbench"
            "zulu"

            #Children Garbage
            #"roblox"
          ];
          masApps = {
              #"Word" = 462054704;
              #"Excel" = 462058435;
              #"PowerPoint" = 462062816;
              "Onedrive" = 823766827;
              "XCode" = 497799835;
              #"Davinci Resolve" = 571213070;
              "Whatsapp" = 310633997;
              "PDFgear" = 6469021132;
              "The Unarchiver" = 425424353;
              #"Essayist" = 1537845384;
              #"Bitwardin" = 1352778147;
              #"Kofe Flow" = 6762003285;
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

      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

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

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };


  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#TheBetrayer

    darwinConfigurations."TheBetrayer" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        home-manager.darwinModules.home-manager
        {
          users.users.gamal.home = "/Users/gamal";
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.gamal = import ./home.nix;
          };
        }
      ];
    };
  };
}

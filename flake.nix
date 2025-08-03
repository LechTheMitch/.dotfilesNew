{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    anylinuxfs = {
      url = "github:nohajc/homebrew-anylinuxfs";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask, home-manager, ...}:
  let
    configuration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs;
        [ neovim
          fastfetch
          stow
          kitty
          wget
          raycast
          git
          mkalias
          zoxide
          vscode
          nodejs
          iina
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
            "anylinuxfs"
            "btop"
          ];
          casks = [
            "zen"
            "mac-mouse-fix"
            "betterdisplay"
            "command-x"
            "shottr"
            "obs"
            "alt-tab"
            "jordanbaird-ice"
            "utm"
            "protonvpn"
            "crossover"
            "brave-browser"
            "google-chrome"
            "gimp"
            "intellij-idea"
            "clion"
            "pycharm"
            "rider"
            "rustrover"
            "android-studio"
          ];
          masApps = {
              "Word" = 462054704;
              "Excel" = 462058435;
              "PowerPoint" = 462062816;
              "Onedrive" = 823766827;
              "XCode" = 497799835;
              "Davinci Resolve" = 571213070;
              "Dropover" = 1355679052;
              "The Unarchiver" = 425424353;
              # "Quickdrop" = 6740147178;
          };
          onActivation.cleanup = "zap";
          onActivation.autoUpdate = true;
          onActivation.upgrade = true;
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
        dock.show-recents = false;
        dock.tilesize = 56;
        dock.magnification = true;
        dock.expose-group-apps = true;
        dock.minimize-to-application = true;
        dock.wvous-tl-corner = 2;
        dock.wvous-tr-corner = 3;
        dock.wvous-br-corner = 11;
        dock.wvous-bl-corner = 4;
        dock.persistent-apps = [
          "/Applications/Zen.app"
          "${pkgs.kitty}/Applications/kitty.app"
          "${pkgs.vscode}/Applications/Visual Studio Code.app"
        ];
        loginwindow.GuestEnabled = false;
        finder._FXSortFoldersFirst = true;
        finder.ShowExternalHardDrivesOnDesktop = false;
        finder.FXPreferredViewStyle = "clmv";
        finder.AppleShowAllFiles = false;
        finder.ShowPathbar = true;
        finder.ShowStatusBar = true;
        finder.FXDefaultSearchScope = "SCcf";
        finder.NewWindowTarget = "Home";
        NSGlobalDomain.KeyRepeat = 2;
        NSGlobalDomain.NSWindowShouldDragOnGesture = true;
        NSGlobalDomain.AppleICUForce24HourTime = true;
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
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gamal = import ./home.nix;
          }
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = "gamal";

            # Optional: Declarative tap management
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "nohajc/homebrew-anylinuxfs" = inputs.anylinuxfs;
            };

            # Optional: Enable fully-declarative tap management
            #
            # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
            mutableTaps = true;
          };
        }
      ];
    };
  };
}

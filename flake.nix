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
          (python312.withPackages (ps: [ ps.pip ]))
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

        imports = [
          ./modules/homebrew.nix
          ./modules/macos-config.nix
        ];

      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;
      system.configurationRevision = self.rev or self.dirtyRev or null;

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

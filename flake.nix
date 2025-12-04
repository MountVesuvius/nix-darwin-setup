# System Flake
# Used for installations system wide that should be available constantly
{
  description = "Base Nix-Darwin Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager - better manage user environment
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Homebrew Support - connect up homebrew to nix to make my life easier
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      ...
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
          nixpkgs.config.allowUnfree = true;

          # System Mappings
          # system.defaults requires you to set the primaryUser
          system.primaryUser = "atlas"; # TODO: there needs to be a way to use this down below
          users.users.atlas = {
            home = "/Users/atlas";
          };

          system.defaults = {
            dock.autohide = true;
            dock.magnification = false;
            dock.mineffect = "genie";
            finder.FXPreferredViewStyle = "clmv";
            loginwindow.GuestEnabled = false;
            NSGlobalDomain.AppleInterfaceStyle = "Dark";
            NSGlobalDomain.KeyRepeat = 2;

            # universalaccess.reduceMotion = true;

            # FIX: These don't seem to do anything... do more research
            trackpad.Clicking = true;
            trackpad.TrackpadRightClick = true;
            trackpad.TrackpadRotate = true;
          };

          # FIX: This doesn't work, I just manually changed it in system settings
          # I'm not sure why, but it seems to be a well known bug
          # https://github.com/nix-darwin/nix-darwin/issues/905
          system.keyboard = {
            enableKeyMapping = true;
            remapCapsLockToEscape = true;
          };

          fonts.packages = [
            pkgs.nerd-fonts.jetbrains-mono
          ];

          # FIX: This was a hot patch solution to packages defaulting to Apple
          # preconfigured developer tools. Probably should fix this because it
          # might have consiquences im unaware of
          environment.systemPath = [
            "/run/current-system/sw/bin"
            "/Users/atlas/.nix-profile/bin"
            "/nix/var/nix/profiles/default/bin"
            "/usr/local/bin"
            "/System/Cryptexes/App/usr/bin"
            "/usr/bin"
            "/bin"
            "/usr/sbin"
            "/sbin"
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          programs.zsh.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # Package Installs
          # TODO: Currently installing GUI applications here because there seems
          # to be an issue where they don't install correctly with home manager
          environment.systemPackages = with pkgs; [
            ghostty-bin
            discord
          ];

          # TODO: Consider moving this out of system install into user space
          homebrew = {
            enable = true;
            casks = [
              "hammerspoon"
              "orion"
            ];
          };
        };
    in
    {
      # Build Flake using `sudo darwin-rebuild switch --flake .#Terra`
      darwinConfigurations."Terra" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration

          # Home Manager Start
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Home flake entrypoint
            home-manager.users.atlas = import ./home/atlas.nix;
          }
          # Home Manager End

          # Homebrew Start
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "atlas"; # TODO: try and make this default user

              # Declarative tap management
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };

              # Enable fully-declarative tap management
              mutableTaps = false;
            };
          }
          (
            # Align homebrew taps config with nix-homebrew
            { config, ... }:
            {
              homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
            }
          )
          # Homebrew End
        ];
      };
    };
}

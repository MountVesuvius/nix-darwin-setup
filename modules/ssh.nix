{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    # Keys stick around in the macOS Keychain
    extraConfig = ''
      AddKeysToAgent yes
      UseKeychain yes
      # Load the config file first
      Include ~/.ssh/config.d/work-secrets
    '';

    matchBlocks = {
      # Personal
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };

      # Work
      "work-host" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519_work";
        identitiesOnly = true;
      };
    };
  };
}

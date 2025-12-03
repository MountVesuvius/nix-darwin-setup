{ config, pkgs, ... }:

# This is user level management. atm i don't have additional users so it's all here
{
  home.username = "atlas";
  home.stateVersion = "25.05";

  imports = [
    ../modules/neovim.nix
    ../modules/zsh.nix
  ];

  # User-level packages (what used to be environment.systemPackages)
  # I think for now im going to just use this for CLI tools
  home.packages = with pkgs; [
    ripgrep
    git
    tree
    fzf
  ];

  # Instant dev shells
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Git Settings
  programs.git = {
    enable = true;
    settings.user.email = "119111598+MountVesuvius@users.noreply.github.com"; # it's not much but i guess
    settings.user.name = "MountVesuvius";
  };
}

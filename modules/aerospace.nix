{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.config/dotfiles";
in
{
  # home.file.".aerospace.toml".source =
  #   config.lib.file.mkOutOfStoreSymlink
  #     "${config.home.homeDirectory}/.config/dotfiles/.aerospace.toml";

  home.file.".aerospace.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.aerospace.toml";

  # If I ever want to spin up more than a single config file
  # xdg.configFile."aerospace".source =
  #   config.lib.file.mkOutOfStoreSymlink "${dotfiles}/aerospace";
}

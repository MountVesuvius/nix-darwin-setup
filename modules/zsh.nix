{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    syntaxHighlighting.enable = true;

    # Add shell aliases
    shellAliases = {
      ll = "ls -la";
      v = "nvim";
    };

    # Environment variables
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "less";
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";

      plugins = [
        "git"
        "sudo"
        "colored-man-pages"
        "extract"
        "z"
      ];
    };
  };
}

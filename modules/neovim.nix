{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;

    # All binaries that Neovim should see in PATH
    extraPackages = with pkgs; [
      ripgrep
      fd

      # LSP servers
      vimPlugins.nvim-lspconfig
      lua-language-server
      typescript-language-server
      nodePackages.typescript # tsc – required by TS LS
      nodePackages.eslint # used by eslint LSP
      vscode-langservers-extracted
      angular-language-server
      vscode-css-languageserver
      tailwindcss-language-server
      emmet-language-server
      gopls
      sqls
      clang-tools # provides `clangd`
      vue-language-server
      basedpyright

      nil
      nixfmt-rfc-style
    ];
  };

  # Symlink to dotfiles for nvim
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/dotfiles/nvim";
}

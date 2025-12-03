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
      lua-language-server
      typescript-language-server
      nodePackages.typescript # tsc – required by TS LS
      nodePackages.eslint # used by eslint LSP
      gopls
      sqls
      clang-tools # provides `clangd`

      nil
      nixfmt-rfc-style

      # Optional: formatters etc.
      # stylua
      # nodePackages.prettier
      # shfmt
      # gofumpt
    ];
  };

  # Symlink to dotfiles for nvim
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/dotfiles/nvim";
}

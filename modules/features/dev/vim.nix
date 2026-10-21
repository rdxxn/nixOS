{ pkgs, username, ... }:
{
  home-manager.users.${username} = {
    programs.neovim.enable = true;
    programs.vim.enable = true;

    home.packages = [ pkgs.tree-sitter ];
  };

    # TODO - https://github.com/pfassina/lazyvim-nix use this nix flake for lazyvim maybe?
}

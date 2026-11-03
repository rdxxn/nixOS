{ pkgs, username, ... }:
{
  home-manager.users.${username} = {
    programs.neovim.enable = true;
    programs.vim.enable = true;

    home.packages = [ 
      pkgs.tree-sitter
      pkgs.lazygit
      pkgs.lua-language-server
      pkgs.stylua
      pkgs.nil 
      ];
  };
}

{lib, pkgs, ...}:
{
  programs.neovim.enable = true;
  programs.vim.enable = true;

  home.packages = with pkgs; [
    tree-sitter
  ];

  # https://github.com/pfassina/lazyvim-nix use this nix flake for lazyvim?
}
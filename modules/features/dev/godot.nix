{ pkgs, username, ...}:
{
  home-manager.users.${username}.home.packages = [ pkgs.godot-mono ];

  # vscodium support with home manager https://wiki.nixos.org/wiki/Godot-Mono
}
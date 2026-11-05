{username, ...}:
{
  home-manager.users.${username}.programs = [ pkgs.godot-mono ];

  # vscodium support with home manager https://wiki.nixos.org/wiki/Godot-Mono
}
# Other JDK versions (and project libraries) come from per-project dev shells:
# two JDKs in one profile collide on bin/java.
{ pkgs, username, ... }:
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      gcc
      gnumake
      cmake
      meson
      ninja
      pkg-config
      (python3.withPackages (ps: [ ps.pip ]))
      uv
      nodejs
      rustup
      tree-sitter
      ncurses
      bzip2
      xz
      cunit
    ];

  # various versions for dat minecraft :sunglasses:
  programs.java = {
    enable = true;
    package = [pkgs.jdk25, pkgs.jdk21, pkgs.jdk17, pkgs.jdk16, pkgs.jdk8];
  }

    # lets dev shells load automatically when you cd into a project
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}

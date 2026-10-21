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

  programs.java = {
    enable = true;
    package = pkgs.jdk25;
  };

    # lets dev shells load automatically when you cd into a project
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}

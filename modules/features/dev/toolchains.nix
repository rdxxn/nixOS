{pkgs, ...}:
{
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
    package = [pkgs.jdk25, pkgs.jdk21, pkgs.jdk17, pkgs.jdk16, pkgs.jdk8];
  }

  # allows direnv & compat to work with nix dev shells
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  }
}
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
      (python3.withPackages (ps: [ ps.pip ])) # installs python with pip
      uv
      nodejs
      rustup
      tree-sitter
      ncurses
      bzip2
      xz
      cunit
      junit
    ];

  # additional MC jars come from prism launcher
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

{ pkgs, username, ... }:
{
  home-manager.users.${username} = {
    programs = {
      btop.enable = true;
      fastfetch.enable = true;
    };

    home.packages = with pkgs; [
      lsof
      ncdu
      tree
      file
      unzip
      zip
      _7zz
      wget
      gping
      ripgrep
    ];
  };
}

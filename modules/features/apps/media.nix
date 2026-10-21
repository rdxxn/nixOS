{ pkgs, username, ... }:
{
  home-manager.users.${username} = {
    programs.mpv.enable = true;

    home.packages = with pkgs; [
      imv
      ffmpeg
      vlc
    ];
  };
}

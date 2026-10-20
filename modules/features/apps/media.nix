{pkgs, ...}:
{
  programs.mpv.enable = true;
  # if nixpkgs has unfree codecs install vlc too
  home.packages = with pkgs; [
    imv
    ffmpeg
  ];
}
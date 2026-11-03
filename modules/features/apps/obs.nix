{ pkgs, username, ... }:
{
  home-manager.users.${username}.programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture # per-app audio sources
      wlrobs # wlroots capture, sway only
    ];
  };
}

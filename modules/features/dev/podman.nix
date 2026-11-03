{ pkgs, username, ... }:
{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # docker alias for podman
    defaultNetwork.settings.dns_enabled = true; # containers on one network can resolve each other
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  home-manager.users.${username} = {
    home.packages = with pkgs; [
      podman-compose
      lazydocker
    ];

    # the podman module already enables the rootless podman.socket; this points tools at it
    home.sessionVariables.DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/podman/podman.sock";
  };
}
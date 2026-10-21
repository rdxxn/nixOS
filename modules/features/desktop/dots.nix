{ lib, pkgs, username, ... }:
{
  home-manager.users.${username} =
    { config, ... }:
    let
      dots = "${config.home.homeDirectory}/dots";
      link = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
    in
    {
      # symlinks dots to a live checkout so noctalia and others can use/edit
      xdg.configFile = {
        "sway/config".source = link "sway/config";
        "kitty/current-theme.conf".source = link "kitty/current-theme.conf";
        "kitty/themes/noctalia.conf".source = link "kitty/themes/noctalia.conf";
        "noctalia/noctalia-full-config.toml".source = link "noctalia/noctalia-full-config.toml";
      };

      # A service to retry instead of just an activation, so you can boot offline first time
      systemd.user.services.clone-dots = {
        Unit = {
          Description = "Clone dotfiles";
          ConditionPathExists = "!%h/dots/.git";
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${lib.getExe pkgs.git} clone --depth 1 https://github.com/rdxxn/dots.git %h/dots";
          Restart = "on-failure";
          RestartSec = 30;
        };
        Install.WantedBy = [ "default.target" ];
      };
    };
}

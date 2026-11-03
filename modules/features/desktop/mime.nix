{ pkgs, username, ... }:
{
  home-manager.users.${username} = {home.packages = [ pkgs.mousepad ];

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = "org.xfce.mousepad.desktop";
        "text/markdown" = "org.xfce.mousepad.desktop";
        "text/x-log" = "org.xfce.mousepad.desktop";
      };
    };
  };
}
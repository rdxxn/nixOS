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
        "niri/config.kdl".source = link "niri/config.kdl";
        "niri/keybinds.kdl".source = link "niri/keybinds.kdl";
        "noctalia/noctalia-full-config.toml".source = link "noctalia/noctalia-full-config.toml";
        "nvim".source = link "nvim";
        "qBittorrent".source = link "qBittorrent";

        # Small theme assets still convenient as links
        "bat/themes/catppuccin-mocha.tmTheme".source = link "bat/themes/catppuccin-mocha.tmTheme";
        "btop/themes/catppuccin_mocha.theme".source = link "btop/themes/catppuccin_mocha.theme";
        "lazygit/themes/red.yml".source = link "lazygit/themes/red.yml";
        "yazi/flavors/catppuccin.yazi/flavor.toml".source = link "yazi/flavors/catppuccin.yazi/flavor.toml";
        "yazi/flavors/catppuccin.yazi/tmtheme.xml".source = link "yazi/flavors/catppuccin.yazi/tmtheme.xml";
        "zellij/config.kdl".source = link "zellij/config.kdl";
        "fastfetch/config.jsonc".source = link "fastfetch/config.jsonc";
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
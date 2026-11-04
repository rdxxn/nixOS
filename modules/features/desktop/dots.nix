{ lib, pkgs, username, ... }:
{
  home-manager.users.${username} =
    { config, ... }:
    let
      dots = "${config.home.homeDirectory}/dots";
      link = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
    in
    {
      # TODO - the other symlinks 
      # symlinks dots to a live checkout so noctalia and others can use/edit
      xdg.configFile = {
        "sway/config".source = link "sway/config";
        "niri/config.kdl".source = link "niri/config.kdl";
        "niri/keybinds.kdl".source = link "niri/keybinds.kdl";
        "kitty/current-theme.conf".source = link "kitty/current-theme.conf";
        "kitty/kitty.conf".source = link "kitty/kitty.conf";
        "noctalia/noctalia-full-config.toml".source = link "noctalia/noctalia-full-config.toml";
        "bat/config".source = link "bat/config";
        "bat/themes/catppuccin-mocha.tmTheme".source = link "/bat/themes/catppuccin-mocha.tmTheme";
        "btop/btop.conf".source = link "btop/btop.conf";
        "btop/themes/catppuccin_mocha.theme".source = link "btop/themes/catppuccin_mocha.theme";
        "fastfetch/config.jsonc".source = link "fastfetch/config.jsonc";
        "fish/config.fish".source = link "fish/config.fish";
        "fzf/themes/catppuccin-mocha.fish".source = link "fzf/themes/catppuccin-mocha.fish";
        "helixnotes/config.json".source = link "helixnotes/config.json";
        "lazygit/config.yml".source = link "lazygit/config.yml";
        "lazygit/themes/red.yml".source = link "lazygit/themes/red.yml";
        "nvim".source = link "nvim"; # links whole folder for lazyvim
        "qBittorrent".source = link "qBittorrent";
        "tealdeer/config.toml".source = link "tealdeer/config.toml";
        "xfce4/xfconf/xfce-perchannel-xml/thunar.xml".source = link "xfce4/xfconf/xfce-perchannel-xml/thunar.xml";
        "yazi/theme.toml".source = link "yazi/theme.toml";
        "yazi/flavors/catppuccin.yazi/flavor.toml".source = link "yazi/flavors/catppuccin.yazi/flavor.toml";
        "yazi/flavors/catppuccin.yazi/tmtheme.xml".source = link "yazi/flavors/catppuccin.yazi/tmtheme.xml";
        "zellij/config.kdl".source = link "zellij/config.kdl";
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
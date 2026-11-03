{ inputs, pkgs, username, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  # the GTK target stores settings in dconf
  programs.dconf.enable = true;

  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    # the GTK target takes its font from here (the default is DejaVu), so mirror fonts.nix
    fonts = {
      sansSerif = { name = "Inter"; };
      serif = { name = "Noto Serif"; };
      monospace = { name = "JetBrainsMono Nerd Font"; };
      emoji = { name = "Noto Color Emoji"; };
    };

    # swaps the accent to catppuccin red.
    override.base0D = "f38ba8";

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus";
    };

    targets = {
      gtk.enable = true;
      qt.enable = true;
    };
  };
}
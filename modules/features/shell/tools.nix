{ pkgs, username, ... }:
{
  home-manager.users.${username} = {
    programs = {
      btop = {
        enable = true;
        settings = {
          color_theme = "catppuccin_mocha";
          theme_background = true;
          truecolor = true;
          rounded_corners = true;
          vim_keys = false;
          shown_boxes = "proc net cpu mem gpu0";
          update_ms = 2000;
          proc_sorting = "cpu direct";
          proc_reversed = true;
          proc_tree = true;
          proc_colors = true;
          proc_gradient = true;
          proc_per_core = true;
          graph_symbol = "braille";
        };
      };
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
      usbutils
      pciutils
      rsync
    ];
  };
}

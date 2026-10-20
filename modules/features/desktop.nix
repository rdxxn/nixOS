{ config, pkgs, lib, ... }:

# Allow unstable packages
let 
        unstable = import <nixpkgs-unstable> { inherit (config.nixpkgs) config; };
in
{
    # -------------------------
    # Sway
    # -------------------------
      # Enable Sway & remove optional dependencies
      programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        extraPackages = [];
     };
    # -------------------------
    # greetd + GTKgreet
    # -------------------------
    services.greetd = {
      enable = true;
      settings = {
        terminal.vt = 1;
        default_session = {
         command = "${pkgs.sway}/bin/sway --config /etc/greetd/sway-config";
         user = "greeter";
        };
      };
    };

    environment.etc."greetd/sway-config".text = ''
     exec "${pkgs.gtkgreet}/bin/gtkgreet -l -s /etc/greetd/gtkgreet-style.css; swaymsg exit"

      bindsym Mod4+shift+e exec swaynag \
          -t warning \
          -m 'What do you want to do?' \
          -b 'Poweroff' 'systemctl poweroff' \
          -b 'Reboot' 'systemctl reboot'
    '';
    # CSS
    ## catpuccin mocha palette https://catppuccin.com/palette/
    environment.etc."greetd/gtkgreet-style.css".text = ''
      window {
          background-image: url("file:///etc/greetd/gtkgreet-background.jpg");
          background-size: cover;
          background-position: center;
      }
      box#body {
          background-color: #1e1e2e;
          border-radius: 10px;
          padding: 50px;
          opacity: 0.75;
      }
      label { color: #cdd6f4; }
      entry {
          color: #cdd6f4;
          background-color: #313244;
          caret-color: #6c7086;
          border: 2px solid #313244;
          box-shadow: none;
      }
      entry:focus {
          border: 2px solid #f38ba8;
          box-shadow: none;
          outline-color: #f38ba8;
      }
      combobox, combobox button, combobox arrow {
          border: none;
          background-image: none;
          box-shadow: none;
      }
      button.suggested-action { color: #1e1e2e; background-color: #f38ba8; }
      button.suggested-action label { color: #1e1e2e; }
      button.suggested-action:hover { background-color: #eba0ac; }
     button {
          color: #cdd6f4;
          background-color: #313244;
          background-image: none;
          border: none;
          box-shadow: none;
      }
      button:hover { background-color: #45475a; }
    '';

    # Requires /home/rdxxn/dots to already be cloned before the first rebuild
    environment.etc."greetd/gtkgreet-background.jpg".source = /home/rdxxn/dots/wallpapers/catskyline.jpg;

    environment.etc."greetd/environments".text = ''
      sway
      fish
      bash
     '';

    # -------------------------
    # fonts
    # -------------------------
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      inter
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];

    # -------------------------
    # programs
    # -------------------------
      programs.xwayland.enable = true;


      # Enables Gnome Keyring to store secrets for applications. 
      services.gnome.gnome-keyring.enable = true;
      security.pam.services.greetd.enableGnomeKeyring = true;

      xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      };

    # Add XDG-USER-DIRS in another module (maybe remove music?)
    # TODO: Add noctalia hibernate button (other repo)
    # TODO: yazi plugins (go over deps to make sure theyre met like lazygit, some of them in other modules)
    environment.systemPackages = with pkgs; [
      wl-clipboard
      grim
      slurp
      xdg-utils
      noctalia
      librewolf
    ]
    ++
    [
      unstable.yazi
    ];
}
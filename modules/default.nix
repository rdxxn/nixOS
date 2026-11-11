# Defaults, gaming, snapshots, sshd and eduroam & others are imported by the host
{
  imports = [
    ./features/nix/settings.nix
    ./features/nix/unfree.nix
    ./features/nix/tools.nix
    ./features/nix/unstable.nix

    ./features/system/boot.nix
    ./features/system/compat.nix
    ./features/system/hardware.nix
    ./features/system/home-dirs.nix
    ./features/system/home-manager.nix
    ./features/system/locale.nix
    ./features/system/networking.nix
    ./features/system/printing.nix
    ./features/system/users.nix
    ./features/system/yubikey.nix
    ./features/system/version.nix

    ./features/desktop/audio.nix
    ./features/desktop/dots.nix
    ./features/desktop/flatpak.nix
    ./features/desktop/fonts.nix
    ./features/desktop/greeter.nix
    ./features/desktop/theme.nix
    ./features/desktop/mime.nix
    ./features/desktop/niri.nix
    ./features/desktop/noctalia.nix
    ./features/desktop/sway.nix
    ./features/desktop/WM-helpers.nix
    ./features/desktop/thunar.nix
    ./features/desktop/PWA.nix

    ./features/shell/docs.nix
    ./features/shell/fish.nix
    ./features/shell/kitty.nix
    ./features/shell/zellij.nix
    ./features/shell/nav.nix
    ./features/shell/tools.nix
    ./features/shell/yazi.nix

    ./features/dev/git.nix
    ./features/dev/vscodium.nix
    ./features/dev/podman.nix
    ./features/dev/toolchains.nix
    ./features/dev/vim.nix
    ./features/dev/ide.nix

    ./features/apps/torrenting.nix
    ./features/apps/blender.nix
    ./features/apps/browser.nix
    ./features/apps/media.nix
    ./features/apps/mpv-tracker.nix
    ./features/apps/notes.nix
    ./features/apps/vpn.nix
    ./features/apps/localsend.nix
  ];
}

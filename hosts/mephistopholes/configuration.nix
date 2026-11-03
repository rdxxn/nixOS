{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    #../../modules/features/system/snapshots.nix
  ];

  # allows updating device firmware included uefi
  services.fwupd.enable = true;

  # prevents overheating (intel only)
  services.thermald.enable = true;

  # tlp for battery life. It conflicts with power-profiles-daemon and tuned, so neither is enabled.
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;

  # handles closing the lid
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
    HandleLidSwitchExternalPower = "suspend";
    HandleLidSwitchDocked = "ignore";
  };

  system.stateVersion = "26.05";

  # TODO - update dots repo (gtk/qt theming and niri config and librewolf and  stuff)
  # TODO - ^ maybe stylix instead for somethings? investigate
  # TODO - superlightweight text editor as the default for things like txt and such
  # TODO - vscodium flatpak
  # TODO - install niri as an option
  # TODO - install helixnotes (flake)
  # TODO - protonvpn
  # TODO - neovim configurations/lazyvim
  # TODO - ai module with something like qwencode(look into best options) with qwen3.8 and a lighter model done declaratively + ollama for the backend
  # TODO - maybe replace fish with bash (POSIX compliant) + plugins? (blesh?), would need to port aliases so maybe stay with fish? is there a good way to get posix compliance in fish other than running bash/bash -c ""
  # TODO - batman (better man pages)
  # TODO - nix-output-monitor / nh / comma / nix-index-database / statix / deadnix / nixfmt-rfc-style / flake-utils / flake-parts. FIND WHAT I NEED FOR ME
  # TODO - Alias the rebuild&build commands to the actual nix directory so it can be ran from anywhere
  # TODO - ungoogled chromium flatpak (webhid & PWAs)
  # TODO -  PWA's for somethings CHROMIUM BASED IDEALLY(WEBHID) (protonmail, bbb.pulsar.gg) or if not chromium just .desktop to link to the librewolf site for noctalia launcher
  # TODO - actually finish the containers module (podman/podman-docker)
  # TODO - fix steam popups being in the middle of the screen and stealing focus in niri
  # TODO - maybe add just the command runner
  # TODO - Zellij in tmux mode (want to learn tmux syntax for sysadmin)
  # TODO - lazydocker? (need research), looks promising
  # TODO - usbutils, powertop, smartmontools
  # TODO - fsyncs
  # TODO - obs studio as an optional module
  # TODO - Actually create a valid home folder with all the directories (removed unwanted and add a couple more)
  # TODO - replace discord with vesktop (lighter, opensource & more private)
  # TODO - generate faust configuration.nix for my personal desktop computer 


  # TODO - Actual icon pack
  #stylix.icons = {
  #enable = true;
  #package = pkgs.papirus-icon-theme;
  #dark = "Papirus-Dark";
};

}

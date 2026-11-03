{ username, ... }:
{
  home-manager.users.${username} =
    let
      chromium = "flatpak run io.github.ungoogled_software.ungoogled_chromium";
      entry = name: exec: icon: {
        inherit name exec icon;
        categories = [ "Network" ];
        terminal = false;
      };
    in
    {
      xdg.desktopEntries = {
    proton-mail = entry "Proton Mail" "librewolf --new-window https://mail.proton.me" "mail-message-new";
    pulsar-configurator = entry "Pulsar Configurator" "${chromium} --app=https://bbb.pulsar.gg" "input-mouse";
      # TODO - add via
      };
    };
}
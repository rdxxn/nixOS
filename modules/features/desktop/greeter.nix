# TODO - sort settings as below
# Settings > Security > Noctalia Greeter > Sync Now in Noctalia.
{ inputs, ... }:
{
  imports = [ inputs.noctalia-greeter.nixosModules.default ];

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings.keyboard.layout = "gb";
  };

  # unlock gnome-keyring at login
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
}

# opt in, (laptop on eduroam shouldnt)
{ username, ... }:
{
  services.openssh = {
    enable = true; # opens port 22
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  # passwordless, key only
  users.users.${username}.openssh.authorizedKeys.keys = [
    # TODO
  ];
}

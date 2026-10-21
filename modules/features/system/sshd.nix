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

  # passwords off, you can only get in with a key
  users.users.${username}.openssh.authorizedKeys.keys = [
    # TODO "ssh-ed25519 AAAA..."
  ];
}

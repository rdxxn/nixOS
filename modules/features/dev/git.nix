{ username, ... }:
{
  # SSH/PGP keys on hw key
  home-manager.users.${username}.programs = {
    git.enable = true;
    delta = {
      enable = true;
      enableGitIntegration = true;
    };
    lazygit.enable = true;
  };
}

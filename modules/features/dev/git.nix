{pkgs, ...}:
{
  programs = {
    git.enable = true; # TODO ssh keys/identity
    delta = {
      enable = true;
      enableGitIntegration = true;
    };
    lazygit.enable = true;
  };
}
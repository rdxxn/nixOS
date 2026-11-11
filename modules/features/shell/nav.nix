{ username, ... }:
{
  home-manager.users.${username}.programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
      defaultOptions = [
        "--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8"
        "--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC"
        "--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8"
        "--color=selected-bg:#45475A"
        "--color=border:#6C7086,label:#CDD6F4"
      ];
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    fd.enable = true;
    eza.enable = true;
    bat = {
      enable = true;
      extraPackages = [ pkgs.bat-extras.batman ]; # bat but for man pages
      config = {
        theme = "catppuccin-mocha";
      };
    };
    jq.enable = true;
  };
}

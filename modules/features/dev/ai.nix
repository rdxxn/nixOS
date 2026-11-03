{ pkgs, username, ... }:
{
  environment.systemPackages = [
    pkgs.ollama-rocm
  ];

  home-manager.users.${username} = {
    home.packages = [ pkgs.qwen-code ];
    home.sessionVariables.OLLAMA_MODELS = "/var/lib/ollama/models";
  };
}
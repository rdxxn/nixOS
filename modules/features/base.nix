
# Add most recent kernel back

{ config, pkgs, lib, ... }:
{
  # -------------------------
  # Nix
  # -------------------------
  nixpkgs.config.allowUnfree = true;
  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # -------------------------
  # Locale / Time / Keyboard
  # -------------------------
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  console.keyMap = "uk";

  # -------------------------
  # User
  # -------------------------
  users.mutableUsers = true; # set/change the password with `passwd` after first boot
  users.users.rdxxn = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };
  # `rootpw --lock` NixOS equivalent.
  users.users.root.hashedPassword = "!";

  # -------------------------
  # Networking
  # -------------------------
  networking.networkmanager.enable = true;

  # -------------------------
  # SSH
  # -------------------------
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  # -------------------------
  # Firewall
  # -------------------------
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
    # 22 = ssh
  };



  # -------------------------
  # Other
  # -------------------------
  hardware.enableRedistributableFirmware = true;
  
  services.fstrim.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.timesyncd.enable = true;

  services.printing.enable = true;

  # Laptop disables this in favour of tlp for extra battery life
  services.power-profiles-daemon.enable = lib.mkDefault true;
  services.upower.enable = true;


  # -------------------------
  # Shell
  # -------------------------
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    sudo
    man
    less
    groff
    fastfetch
    btop
    bat
    vim
    tealdeer
    curl
    wget
    git
    fzf
    fd
    eza
    zoxide
    jq
    lsof
    ncdu
    tree
    rsync
    file
    unzip
    zip
    p7zip
    kitty
  ];
}
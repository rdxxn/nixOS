{
  hardware.enableRedistributableFirmware = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.fstrim.enable = true;

  # keeps an eye on disk health and installs smartctl to manually check
  services.smartd.enable = true;

  # Allows for webhid in chromium - broad permissions
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", TAG+="uaccess"
  '';
}

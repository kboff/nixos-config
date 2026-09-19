{ config, lib, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    grub = {
      enable = true;
      configurationName = "NixOS";
      device = "nodev";
      efiSupport = true;
	  useOSProber = true;
	  default = true;
	  extraConfig = ''
	    GRUB_SAVEDEFAULT=true
	'';
	  efiInstallAsRemovable = false;   #  false：让 GRUB 注册到固件
    };
    efi.canTouchEfiVariables = true;
	timeout = 5;
  };
  boot.kernelParams = lib.mkForce [               # 对应 GRUB_CMDLINE_LINUX_DEFAULT
    "loglevel=5"
    "nowatchdog"
    "modprobe.blacklist=iTCO_wdt"     # Intel CPU选项,AMD CPU换成sp5100_tco
    "zswap.enabled=0"
  ];
}


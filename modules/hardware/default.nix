{ config, lib, pkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;  #Intel cpu微码

	hardware.graphics = {
	  enable = true;
	  enable32Bit = true;
	};

  boot.zswap.enable = false;
  zramSwap = {
	enable = true;
	memoryPercent = 100;
	algorithm = "zstd";
  };

  services = {
    # for sdd
	fstrim = {
	  enable = true;
	  interval = "weekly";
	};

	xserver.videoDrivers = lib.mkDefault [ "modesetting" ];
  };

}

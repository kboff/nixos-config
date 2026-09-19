{ config, pkgs,... }:

{

  boot.kernelPackages = pkgs.linuxPackages_cachyos;


  # scx_loader
  services.scx-loader = {
    enable = true;
	config.default_sched = "scx_bpfland";
	schedsPackages = [ pkgs.scx.full ];
  };
}

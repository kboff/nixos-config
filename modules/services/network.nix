{ config, lib, pkgs,... }:

{
  networking = {
	networkmanager = {
	  enable = true;
	  wifi.backend = "iwd"
	};

	nftables.enable = true;
	firewall = {
	  enable = true;
	  checkReversePath = false;  # tun 代理模式需关闭？

		hosts."127.0.0.1" = [
# Block this domain to prevent QQ from auto-updating.
		"qqpatch.gtimg.cn"
		];
	};
	# wireless = {
	#   iwd = {
	# 	enable = lib.mkForce true;
	# 	settings = {
	# 	  IPv6 = {
	# 		Enabled = true;
	# 	  };
	# 	  Settings = {
	# 		AutoConnect = true;
	# 	  };
	# 	};
	#   };


	};
}


{ config, pkgs, ... }:

{
  home-manager.users.kboff = {
	programs.kitty = {
	  enable = true;
	#   font.name = "Maple Mono NF CN";
	#   shellIntegration.enableFishIntegration = true;
	#   settings = {
	# 	shell = "fish";
	#   };
	};

    xdg.configFile."kitty".source = ./config;
  };
}

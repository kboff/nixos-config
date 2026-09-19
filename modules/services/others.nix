{ config, lib, pkgs,... }:

{
  services = {
	xserver = {
      excludePackages = [ pkgs.xterm ];
      upscaleDefaultCursor = true;
    };
	power-profiles-daemon.enable = true;
	# upower.enable = true; # 电池相关
	gvfs.enable = true;
  speechd.enable = lib.mkDefault false;  # 文字转语音
  userborn.enable = true;  # 用户管理相关
  # kmscon.enable = true;
  };
}

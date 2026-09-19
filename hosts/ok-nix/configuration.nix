# 模块用途说明: 入口清单。仅 import 子模块并声明基础标识,不写具体系统配置。
{ inputs, lib, pkgs, ... }:

let
  user = "kboff";
  wm = "niri";

in {
  imports = [
    ./hardware-configuration.nix

	  ../../modules/user/${user}.nix
	  ../../modules/system/boot.nix
	  ../../modules/system/env.nix
	  ../../modules/system/fonts.nix
	  ../../modules/system/kernel.nix
	  ../../modules/system/locale.nix

	  ../../modules/hardware/default.nix

	  ../../modules/services/audio.nix
	  ../../modules/services/network.nix
	  ../../modules/services/nix.nix
	  ../../modules/services/others.nix
	  ../../modules/services/ssh.nix
	  ../../modules/services/udisk2.nix

	  ../../modules/desktop/xdg/mimeapps.nix
	  ../../modules/desktop/xdg/xdg.nix
	  ../../modules/desktop/sddm.nix
	  ../../modules/desktop/${wm}/${wm}.nix
	  ../../modules/desktop/noctalia.nix

	  ./kboff.nix
  ];

  system.stateVersion = "26.05";
}

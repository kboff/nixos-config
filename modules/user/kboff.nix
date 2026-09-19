{ pkgs, ... }:

{
  home-manager.users.kboff = {
	home.username = "kboff";
	home.homeDirectory = "/home/kboff";
	home.stateVersion = "26.05";

  };
  imports = [
	./fish/fish.nix
	  ./kitty/kitty.nix
	  ./mpv/mpv.nix
	  ./yazi/yazi.nix
	  ./zen/zen.nix
	  ./clash/clash.nix
	  ./others.nix
  ];
}

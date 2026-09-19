{ pkgs, ... }:
{
  home-manager.users.kboff = {
    home.packages = with pkgs; [
      mediainfo
	  nomacs
    ];
  };
}



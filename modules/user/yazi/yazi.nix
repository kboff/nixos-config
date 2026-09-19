{ config, pkgs, ... }:

{
  home-manager.users.kboff = {
    # Yazi
    programs.yazi.enable = true;

    xdg.configFile."yazi".source = ./config;
  };
}

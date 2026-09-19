{ pkgs, ... }:
{
  home-manager.users.kboff = {
    home.packages = with pkgs; [
      clash-verge-rev
    ];
  };
}

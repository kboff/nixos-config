{ config, pkgs, ... }:

{
  home-manager.users.kboff = {
    programs.mpv = {
      enable = true;

      extraPackages = with pkgs; [
        ffmpeg
        yt-dlp
        libass
        vapoursynth
      ];
    };

    xdg.configFile."mpv".source = ./config;
  };
}

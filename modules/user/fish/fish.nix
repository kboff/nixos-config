{ config, pkgs, ... }:

{
  home-manager.users.kboff = {
    # Fish
    programs.fish.enable = true;

    # 直接导入 Arch 上已有的 Fish 配置目录
    xdg.configFile."fish".source = ./config/fish;

    # Starship
    # programs.starship.enable = true;

    xdg.configFile."starship.toml".source = ./config/starship.toml;
  };
}

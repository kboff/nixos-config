# 模块用途说明: 系统用户 kboff。默认 shell=bash,指定 groups,不配置 Home Manager。
{ pkgs, ... }:
{
  users.users.kboff = {
    isNormalUser = true;
    shell = pkgs.bash;
    initialPassword = "8888";
    extraGroups = [ "wheel" "networkmanager" "video" "render" ];
  };
}

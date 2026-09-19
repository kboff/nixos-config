{ config, pkgs, ... }:

{
  security.rtkit.enable = true;

  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;           # 接管 ALSA
    alsa.support32Bit = true;     # 支持 32 位游戏/旧软件
    pulse.enable = true;          # 兼容 PulseAudio 应用
    jack.enable = false;           # 兼容 JACK 专业应用
    wireplumber.enable = true;    # 启用智能路由
  };

  # hardware.firmware = [ pkgs.sof-firmware ];
}

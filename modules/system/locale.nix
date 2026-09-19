{ lib, pkgs,... }:

{
  networking.hostName = "ok-nix";

  # 时区与中文支持
  time.timeZone = "Asia/Shanghai";

  i18n = {
	defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };
  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  };

  # NTP 时间服务器
  networking.timeServers = [
    "0.cn.pool.ntp.org"
    "1.cn.pool.ntp.org"
    "2.cn.pool.ntp.org"
    "3.cn.pool.ntp.org"

    "ntp1.ntsc.ac.cn"
    "ntp2.ntsc.ac.cn"
    "ntp3.ntsc.ac.cn"

    "ntp1.aliyun.com"
    "ntp2.aliyun.com"
    "ntp3.aliyun.com"

    "ntp1.cstnet.cn"
    "ntp2.cstnet.cn"
  ];

  # HTTP 时间同步服务器
  # services.htpdate.servers = [
  #   "www.baidu.com"
  # ];
}

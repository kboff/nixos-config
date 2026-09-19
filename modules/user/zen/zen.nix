{ inputs, ... }:

{
  home-manager.users.kboff = {
    imports = [
      inputs.zen-browser.homeModules.twilight
    ];

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;

      policies = {
        DisableAppUpdate = true;
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        OfferToSaveLogins = false;
        PasswordManagerEnabled = false;

        ExtensionSettings = let
          force = id: {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";
            installation_mode = "force_installed";
          };
        in {
          "uBlock0@raymondhill.net" = force "ublock-origin";
          "addon@darkreader.org" = force "darkreader";
          "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = force "stylus";
          "firefox@tampermonkey.net" = force "tampermonkey";
          "vimium-c@gdh1995.cn" = force "vimium-c";
          "saladict@crimx.com" = force "saladict";
          "{f4961478-ac79-4a18-87e9-d2fb8c0442c4}" = force "global-speed";
          "{a8332c60-5b6d-41ee-bfc8-e9bb331d34ad}" = force "surfingkeys";
          "tab-time-tracker@extension" = force "tab-time-tracker";
          "maxurl@qsniyg" = force "image-max-url";
          "wbge@nickesc.github.io" = force "white-background-enforcer";
          "{ac87cfd8-47b1-4401-b32e-f033af5ed96b}" = force "get-cookies-txt-locally";
        };
      };

      profiles.default = {
        settings = {
          # Zen
          "zen.urlbar.replace-newtab" = false;
          "zen.widget.linux.transparency" = true;
          "zen.view.compact.enable-at-startup" = true;
          "zen.view.window.scheme" = 0;

          # 隐私
          "privacy.resistFingerprinting" = true;
          "network.dns.disablePrefetch" = true;
          "network.http.speculative-parallel-limit" = 0;
          "network.prefetch-next" = false;

          # 常规
          "browser.tabs.warnOnClose" = false;
          "browser.startup.page" = 3; # 恢复上次会话
          "browser.search.region" = "CN";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };

        search = {
          force = true;
          default = "bing";
          engines = {
            bing.metaData.alias = "@bing";
            baidu.metaData.alias = "@baidu";
          };
        };
      };
    };
  };
}# 可选：自定义 userChrome.css / userContent.css
# userChrome = builtins.readFile ./zen/userChrome.css;
# userContent = builtins.readFile ./zen/userContent.css;

# 可选：声明式安装扩展
# search = {
#   force = true;
#   default = "ddg";
#   engines = {
#     ddg.metaData.alias = "@ddg";
#   };
# };


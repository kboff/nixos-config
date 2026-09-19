{ config, lib, pkgs,...}:

{
  fonts = lib.mkDefault {
    enableDefaultPackages = false;
    fontconfig = {
      enable = true;
	  subpixel.rgba = "rgb";  #  子像素渲染
	  subpixel.lcdfilter = "default";
	  hinting.style = "slight";
	  antialias = true;  # 抗锯齿

      defaultFonts = {
        serif = [
		"Lora"
		"Noto Serif CJK SC"

		]

        sansSerif = [
          "Sarasa Gothic SC"
		  "Noto Color Emoji"
        ];

        monospace = [
          "Maple Mono NF CN"
		  "Noto Color Emoji"
        ];

        emoji = [
          "Noto Color Emoji"
        ];
      };
    };

    fontDir.enable = true;  # For flatpak
    packages = with pkgs; [
      maple-mono.NF-CN
	  nerd-fonts.jetbrains-mono
	  fira-code
	  lora
      noto-fonts-color-emoji
	  twemoji-color-font
	  noto-fonts-cjk-serif
	  noto-fonts
      sarasa-gothic
    ];
  };
}

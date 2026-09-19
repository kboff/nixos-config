{ config, pkgs,... }:

{
  environment.systemPackages = with pkgs; [
    vim
	neovim
	bash
	fastfetch

	git
	wget
    curl

	dnsutils
	nethogs

	nix-output-monitor
	btop
	tmux
	# sbctl   #安全启动密钥管理
	# wayvnc  #远程桌面

	unzip
	unrar
	tar
	p7zip

	fzf
	zoxide
	ripgrep
	fd
	dua
	eza

	ntfsprogs-plus

  ];

  environment.localBinInPath = true;

  environment.sessionVariables = {
	NIXOS_OZONE_WL = "1";
	EDITOR = "vim";
	QT_AUTO_SCREEN_SCALE_FACTOR = "1";
	MOZ_ENABLE_WAYLAND = "1";
  };

  documentation = {
	nixos.enable = true;
  };
}

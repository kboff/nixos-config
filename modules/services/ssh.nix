{ config, pkgs,...}:

{
  services.openssh = {
	enable = true;
	settings = {
	  # PasswordAuthentication = false;
	  KbdInteractiveAuthentication = false;
	  PubkeyAuthentication = true;
	};
	ports = [ 22 ];
  };
}

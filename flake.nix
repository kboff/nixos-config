{
  description = "NixOS unstable flake";

  inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	nixpkgs-stable.url = "github:nixos/nixpkgs/26.05";

	chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

	home-manager = {
	  url = "github:nix-community/home-manager";
	  inputs.nixpkgs.follows = "nixpkgs";
	};

	noctalia.url = "github:noctalia-dev/noctalia";

	zen-browser ={
	  url = "github:0xc000022070/zen-browser-flake";
	  inputs = {
		nixpkgs.follows = "nixpkgs";
		home-manager.follows = "home-manager";
	  };
	};
  };

  outputs = { self, nixpkgs, noctalia, home-manager, chaotic,... }@inputs: {
	nixosConfigurations = {
	  ok-nix = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = { inherit inputs; };
		modules = [
		  ./hosts/ok-nix/configuration.nix
			chaotic.nixosModules.default    # cachyOS内核相关
			noctalia.nixosModules.default
			home-manager.nixosModules.home-manager
			{
			  home-manager = {
				useGlobalPkgs = true;
				useUserPackages = true;
				backupFileExtension = "backup";
			  };
			}
		];
	  }
	};
  };
}

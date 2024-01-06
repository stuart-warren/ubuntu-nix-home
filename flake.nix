{
  description = "My Ubuntu Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    # system = "aarch64-linux"; If you are running on ARM powered computer
    system = "x86_64-linux";
    # myuser = builtins.getEnv "USER";
    myuser = "stuart-warren";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations = {
      "${myuser}" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
	  config.allowUnfree = true;
	};
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
  };
}

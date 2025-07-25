{
  description = "Lil & tiny NixOS configuration for my MacBook Pro";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    mac-app-util.url = "github:hraban/mac-app-util";

    puppydog.url = "github:dogth/puppydog";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      darwin,
      mac-app-util,
      puppydog,
      ...
    }:
    let
      systemConfig = system: {
        system = system;
        # Nix package manager configuration
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in
    {
      darwinConfigurations = {
        ruffc = darwin.lib.darwinSystem {
          inherit (systemConfig "aarch64-darwin") system pkgs;
          specialArgs = { inherit puppydog; }; # Inherit custom packages

          modules = [

            ./user.nix # Home Manager configuration & other(brew/mas) packages
            ./darwin.nix # macOS & system configuration

            # System-wide Home manager ocnfiguration
            home-manager.darwinModules.home-manager
            (
              { pkgs, ... }:
              {
                home-manager.useGlobalPkgs = false;
                home-manager.useUserPackages = true;

                home-manager.sharedModules = [
                  mac-app-util.homeManagerModules.default # Fix /Applications symlink on MacOS
                ];
              }
            )
          ];
        };
      };
    };
}

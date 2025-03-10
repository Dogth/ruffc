{
  inputs,
  nixpkgs,
  puppydog,
  nixpkgs-stable,
  darwin,
  home-manager,
  vars,
  lib,
  ...
}:

let
  systemConfig = system: {
    system = system;
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
  };
in
{
  ruffc =
    let
      inherit (systemConfig "aarch64-darwin") system pkgs stable;
    in
    darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {
        inherit
          inputs
          system
          pkgs
          puppydog
          stable
          vars
          lib
          ;
      };
      modules = [
        ./darwin-configuration.nix
        ./ruffc.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
      ];
    };
}

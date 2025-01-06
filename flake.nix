{
  description = "Dogthie's basic stuff :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    puppydog = {
      url = "github:dogth/puppydog";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      home-manager-stable,
      darwin,
      puppydog,
      ...
    }: # Function telling flake which inputs to use
    let
      vars = {
        user = "dogth";
        location = "$HOME/.setup";
        terminal = "alacritty";
        editor = "nvim";
      };
    in
    {
      darwinConfigurations = (
        import ./darwin {
          inherit (nixpkgs) lib;
          inherit
            inputs
            nixpkgs
            nixpkgs-stable
            home-manager
            darwin
            puppydog
            vars
            ;
        }

      );
    };
}

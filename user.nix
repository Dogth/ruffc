{ pkgs, puppydog, ... }:
{
  imports = (import ./modules);

  users.users.dogth = {
    home = "/Users/dogth";
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    onActivation = {
      upgrade = false;
      cleanup = "zap";
    };

    casks = [
      "element"
      "discord"
      "utm"
      "retroarch-metal"
      "spotify"
    ];
    masApps = {
      "Keynote" = 409183694;
      "Windows Apps" = 1295203466;
      "Wireguard" = 1451685025;
      "Numbers" = 409203825;
      "Pages" = 409201541;
    };
  };

  home-manager.users.dogth = {
    home.packages = [
      # Additional home manager packages
      puppydog.packages.aarch64-darwin.default
    ];
    home.stateVersion = "22.05";
  };

}

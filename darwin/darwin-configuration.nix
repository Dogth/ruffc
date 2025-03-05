{
  pkgs,
  vars,
  inputs,
  ...
}:

{
  imports = (import ./modules);

  users.users.${vars.user} = {
    home = "/Users/${vars.user}";
    shell = pkgs.zsh;
  };

  environment = {
    variables = {
      EDITOR = "${vars.editor}";
      VISUAL = "${vars.editor}";
    };
    systemPackages = with pkgs; [
      eza
      git
      mas
      yazi
      tldr
      quickemu
    ];
  };

  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      upgrade = false;
      cleanup = "zap";
    };
    casks = [
    ];
    masApps = {
      "wireguard" = 1451685025;
    };
  };

  home-manager.users.${vars.user} = {
    home.packages = [
      inputs.puppydog.packages.aarch64-darwin.default
      pkgs.neovide
    ];

    home.stateVersion = "22.05";

  };

  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nix;
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };

  system = {
    stateVersion = 4;
  };
}

{ pkgs, ... }:
{
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "neovide";
    };
    systemPackages = with pkgs; [
      eza
      llvm
      cmake
      git
      mas
      yazi
      tldr
    ];
  };

  system = {
    stateVersion = 5;
    primaryUser = "dogth";
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        NSAutomaticCapitalizationEnabled = false;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.trackpad.enableSecondaryClick" = true;
      };
      finder = {
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
      };

      CustomUserPreferences = {
        "com.apple.finder" = {
          NewWindowTargetPath = "file:///Users/dogth/";
          NewWindowTarget = "PfHm";
          FXDefaultSearchScope = "SCcf";
          FinderSpawnTab = true;
        };
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.AdLib".allowApplePersonalizedAdvertising = false;
      };
    };
  };

  security = {
    pam.services.sudo_local.touchIdAuth = true;
  };

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
}

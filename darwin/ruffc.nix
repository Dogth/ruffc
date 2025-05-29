{
  vars,
  ...
}:

{
  imports = import (./modules);

  environment = {
    systemPackages = [
    ];
  };
  homebrew = {
    casks = [
      "docker"
      "wine-stable"
      "prusaslicer"
      "element"
      "discord"
      "utm"
      "retroarch-metal"
    ];
    masApps = {
      "Keynote" = 409183694;
      "Wireguard" = 1451685025;
      "Numbers" = 409203825;
      "Pages" = 409201541;
    };
  };

  system = {
    primaryUser = vars.user;
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
      magicmouse = {
        MouseButtonMode = "TwoButton";
      };

      CustomUserPreferences = {
        "com.apple.finder" = {
          NewWindowTargetPath = "file:///Users/${vars.user}/";
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
}

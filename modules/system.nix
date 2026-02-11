{pkgs, ...}:
###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#
###################################################################################
{
  system = {
    stateVersion = 6;

    keyboard = {
      enableKeyMapping = true;
      userKeyMapping = [
        {
          HIDKeyboardModifierMappingSrc = 30064771129; # Caps Lock
          HIDKeyboardModifierMappingDst = 30064771296; # Left Control
        }
        {
          HIDKeyboardModifierMappingSrc = 30064771296; # Left Control
          HIDKeyboardModifierMappingDst = 30064771129; # Caps Lock
        }
      ];
    };

    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock

      # Trackpad settings
      trackpad = {
        Clicking = true; # tap to click
        TrackpadThreeFingerDrag = true; # three-finger drag
      };

      # Dock settings
      dock = {
        autohide = true;
        orientation = "bottom";
        showhidden = true;
        mineffect = "scale";
        mru-spaces = false;
        show-recents = false;
      };

      # Keyboard settings - faster typing
      NSGlobalDomain = {
        KeyRepeat = 2; # faster key repeat (default: 6)
        InitialKeyRepeat = 15; # shorter delay before repeat (default: 25)

        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        ApplePressAndHoldEnabled = false;
        "com.apple.keyboard.fnState" = true;
      };

      # Set F18 as input source toggle shortcut (hotkey ID 61)
      CustomUserPreferences = {
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            "61" = {
              enabled = true;
              value = {
                type = "standard";
                parameters = [65535 79 0]; # F18
              };
            };
          };
        };
      };

      # other macOS's defaults configuration.
      # ......
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
}

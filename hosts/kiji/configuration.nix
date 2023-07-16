{ config, pkgs, ... }: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      interval = {
        Weekday = 7;
      };
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;

  time.timeZone = "Asia/Tokyo";

  networking.hostName = "kiji";

  security.pam.enableSudoTouchIdAuth = true;

  users.users.user01 = {
    home = "/Users/user01"; 
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    brews = [
    ];
    casks = [
      "cloudflare-warp"
      "cmd-eikana"
      "discord"
      "fork"
      "ghidra"
      "google-chrome"
      "google-japanese-ime"
      "keybase"
      "kindle"
      "logseq"
      "microsoft-office"
      "microsoft-teams"
      "notion"
      "orbstack"
      "parallels"
      "rectangle"
      "slack"
      "spotify"
      "sublime-text"
      "visual-studio-code"
      "zoom"
    ];
    masApps = {
      "Amazon Prime Video" = 545519333;
      "Grapplin" = 768053424;
      "LINE" = 539883307;
      "RunCat" = 1429033973;
      "Tailscale" = 1475387142;
      "Microsoft Remote Desktop" = 1295203466;
    };
  };

  system.stateVersion = 4;

  system.defaults = {
    loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = false;
    };
    dock = {
      autohide = true;
      orientation = "right";
      show-recents = false;
      static-only = true;
      tilesize = 16;
    };
    finder = {
      AppleShowAllExtensions = true;
      CreateDesktop = false;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
    };
    menuExtraClock = {
      ShowDate = 0;
      ShowDayOfWeek = true;
      ShowSeconds = true;
    };
    NSGlobalDomain = {
      "com.apple.keyboard.fnState" = true;
      "com.apple.trackpad.scaling" = 3.0;
      InitialKeyRepeat = 30;
      KeyRepeat = 2;
      NSTableViewDefaultSizeMode = 1;
    };
    CustomUserPreferences = {
      "com.apple.desktopservices" = {
        "DSDontWriteNetworkStores" = true;
      };
      "com.apple.finder" = {
        _FXSortFoldersFirst = true;
      };
      "com.apple.TextEdit" = {
        RichText = false;
      };
      NSGlobalDomain = {
        "com.apple.sound.uiaudio.enabled" = false;
      };
    };
  };
}

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
    onActivation.cleanup = "none";
    taps = [
      "homebrew/cask-fonts"
    ];
    brews = [
      "asdf"
      "difftastic"
      "llvm"
      "pinentry-mac"
      "openssh"
    ];
    casks = [
      "arc"
      "burp-suite"
      "cloudflare-warp"
      "cmd-eikana"
      "discord"
      "firefox@developer-edition"
      "font-hack-nerd-font"
      "fork"
      "gather"
      "ghidra"
      "google-chrome"
      "google-japanese-ime"
      "iina"
      "jetbrains-toolbox"
      "keybase"
      "kindle"
      "logseq"
      "minecraft"
      "notion"
      "ollama"
      "orbstack"
      "parallels"
      "parsec"
      "postico"
      "postman"
      "rectangle"
      "slack"
      "steam"
      "sublime-text"
      "temurin"
      "via"
      "visual-studio-code"
      "wireshark"
      "yubico-authenticator"
      "zed"
      "zoom"
      "zotero"
    ];
    masApps = {
      "Amazon Prime Video" = 545519333;
      "Bitwarden" = 1352778147;
      "Grapplin" = 768053424;
      "Goodnotes" = 1444383602;
      "Keynote" = 409183694;
      "Kindle" = 302584613;
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
      "com.apple.AppleMultitouchTrackpad" = {
        Clicking = 1;
      };
      "com.apple.desktopservices" = {
        "DSDontWriteNetworkStores" = true;
      };
      "com.apple.finder" = {
        _FXSortFoldersFirst = true;
      };
      "com.apple.TextEdit" = {
        RichText = false;
      };
      "com.microsoft.VSCode" = {
        ApplePressAndHoldEnabled = false;
      };
      NSGlobalDomain = {
        "com.apple.sound.uiaudio.enabled" = false;
      };
    };
  };
}

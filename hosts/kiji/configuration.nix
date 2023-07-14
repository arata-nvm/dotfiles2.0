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
      "RunCat" = 1429033973;
      "Tailscale" = 1475387142;
    };
  };

  system.stateVersion = 4;
}

{ pkgs, ... }: {
  home = {
    username = "user01";
    homeDirectory = "/Users/user01";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bat
    p7zip
    gh
    ghq
    gnumake
    gnupg
    ripgrep
    rustup
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
      . /opt/homebrew/opt/asdf/libexec/asdf.sh
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Arata";
    userEmail = "arata04962@gmail.com";
    signing.key = "C2519FDB42260A71672C89629D4451B39F20F741";
    signing.signByDefault = true;
    ignores = [ ".DS_Store" ];
    extraConfig = {
      core.ignorecase = false;
      ghq.root = "/Users/user01/src";
      color.ui = true;
      pull.rebase = false;
      diff.tool = "difftastic";
      diff.external = "difft";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}

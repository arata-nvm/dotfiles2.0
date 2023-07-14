{ pkgs, ... }: {
  home = {
    username = "user01";
    homeDirectory = "/home/user01";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neofetch
    vscode
    ripgrep
    docker-compose
    google-chrome
    ghidra-bin
    gdb
    pwndbg
    pwntools
    ghq
    gh
    gnumake
  ];

  programs.zsh = {
    enable = true;
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
    extraConfig = {
      core.ignorecase = false;
      ghq.root = "/home/user01/src";
      color.ui = true;
      pull.rebase = false;
    };
  };
}

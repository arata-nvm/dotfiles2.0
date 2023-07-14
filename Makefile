.PHONY: nixos/init
nixos/init:
	sudo nixos-rebuild switch --flake .#hishikui --extra-experimental-features "nix-command flakes" --impure

.PHONY: nixos/update
nixos/update:
	sudo nixos-rebuild switch --flake .#hishikui --impure

.PHONY: macos/init
macos/init:
	sudo softwareupdate --install-rosetta
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
	nix build .#darwinConfigurations.kiji.system --extra-experimental-features "nix-command flakes"
	./result/sw/bin/darwin-rebuild switch --flake .#kiji

.PHONY: macos/update
macos/update:
	nix build .#darwinConfigurations.kiji.system 
	./result/sw/bin/darwin-rebuild switch --flake .#kiji
  

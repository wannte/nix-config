HOSTNAME := $(shell hostname -s)

deploy:
	sudo PATH="$$PATH" darwin-rebuild switch --flake .#$(HOSTNAME)

fmt:
	nix fmt

update:
	nix flake update

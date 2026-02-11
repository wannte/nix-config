HOSTNAME := $(shell hostname -s)

deploy:
	sudo darwin-rebuild switch --flake .#$(HOSTNAME)

fmt:
	nix fmt

update:
	nix flake update

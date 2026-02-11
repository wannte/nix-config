HOSTNAME := $(shell hostname -s)

deploy:
	darwin-rebuild switch --flake .#$(HOSTNAME)

fmt:
	nix fmt

update:
	nix flake update

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

Apply configuration changes:
```bash
darwin-rebuild switch --flake ~/.config/nix
```

Format nix files:
```bash
nix fmt
```

Update flake inputs:
```bash
nix flake update
```

## Architecture

This is a nix-darwin + home-manager configuration for macOS (aarch64-darwin).

**flake.nix** - Entry point defining inputs (nixpkgs-darwin 25.11, home-manager, nix-darwin) and the darwin configuration. User settings (username, email, hostname) are defined here and passed to modules via `specialArgs`.

**modules/** - System-level nix-darwin configuration:
- `nix-core.nix` - Nix settings, substituters, garbage collection
- `system.nix` - macOS defaults (keyboard, trackpad, dock), TouchID sudo
- `apps.nix` - Homebrew casks (cleanup mode: zap)
- `host-users.nix` - Hostname and user setup

**home/** - User-level home-manager configuration:
- `default.nix` - Imports submodules, sets home directory
- `core.nix` - CLI packages via nix (git, gh, kubectl, awscli2, asdf-vm, etc.)
- `shell.nix` - Zsh config, fzf integration, aliases
- `git.nix` - Git config (removes ~/.gitconfig, uses ~/.config/git/config)

## Key Details

- Homebrew is managed declaratively with `cleanup = "zap"` - unlisted apps get removed
- Formatter is alejandra (run via `nix fmt`)
- Caps Lock and Left Control are swapped via keyboard mapping

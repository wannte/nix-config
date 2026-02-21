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

- **패키지 설치 우선순위**: nix 패키지(`home/core.nix`)를 우선 사용한다. Brew cask(`modules/apps.nix`)는 nix에 패키지가 없거나 macOS 네이티브 앱(.app)이 필요한 경우 등 최후의 수단으로만 사용한다.
- Homebrew is managed declaratively with `cleanup = "zap"` - unlisted apps get removed
- Formatter is alejandra (run via `nix fmt`)
- Caps Lock and Left Control are swapped via keyboard mapping

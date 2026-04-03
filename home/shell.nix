{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    initContent = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      export EDITOR="vim"
      . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"

      function lg() {
        echo "Vault"
        vault login -method=oidc
        echo "AWS"
        saml2aws login --force --session-duration=43200
        echo "Sign"
        sign
      }
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        truncate_to_repo = false;
      };
      hostname = {
        ssh_only = true;
        format = "[$ssh_symbol$hostname]($style) ";
        style = "bold red";
      };
      username = {
        show_always = false;
        format = "[$user]($style)@";
      };
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        symbol = " ";
      };
      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        conflicted = "=";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        untracked = "?\${count}";
        stashed = "*\${count}";
        modified = "!\${count}";
        staged = "+\${count}";
        deleted = "✘\${count}";
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.shellAliases = {
    t = "tmux";
    k = "kubectl";
    k9s = "k9s --readonly";
    k9sw = "command k9s";
    cc = "claude --dangerously-skip-permissions";
    cct = "if [ -z \"$TMUX\" ]; then caffeinate -i tmux new-session 'CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude --dangerously-skip-permissions'; else caffeinate -i sh -c 'CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude --dangerously-skip-permissions'; fi";
    tf = "AWS_PROFILE=saml terraform";
  };
}

{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      export EDITOR="vim"
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
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.shellAliases = {
    t = "tmux";
    k = "kubectl";
    cct = "if [ -z \"$TMUX\" ]; then caffeinate -i tmux new-session 'CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude --dangerously-skip-permissions'; else caffeinate -i sh -c 'CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude --dangerously-skip-permissions'; fi";
  };
}

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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.shellAliases = {
    t = "tmux";
    k = "kubectl";
    cct = "if [ -z \"$TMUX\" ]; then tmux new-session 'CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude --dangerously-skip-permissions'; else CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude --dangerously-skip-permissions; fi";
  };
}

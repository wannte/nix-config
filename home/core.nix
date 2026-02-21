{pkgs, ...}: {
  programs.vscode = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
    shortcut = "q";
    mouse = true;
    extraConfig = ''
      # Pane navigation without prefix (Option + hjkl)
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R
    '';
  };

  home.packages = with pkgs; [
    jq
    git
    gh
    bun
    uv

    awscli2
    saml2aws

    k9s
    kubectl
    kubectx
    kubernetes-helm

    asdf-vm

    glow
  ];
}

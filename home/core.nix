{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "q";
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

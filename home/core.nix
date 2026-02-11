{pkgs, ...}: {
  home.packages = with pkgs; [
    jq
    git
    gh
    tmux

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

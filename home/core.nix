{pkgs, ...}: {
  home.packages = with pkgs; [
    # utils
    jq # A lightweight and flexible command-line JSON processor
    git
    gh # GitHub CLI

    awscli2
    saml2aws

    k9s
    kubectl
    kubectx
    kubernetes-helm

    # version manager
    asdf-vm
  ];
}

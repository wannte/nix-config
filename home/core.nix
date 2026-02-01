{pkgs, ...}: {
  home.packages = with pkgs; [
    jq
    git
    gh

    uv

    awscli2
    saml2aws

    k9s
    kubectl
    kubectx
    kubernetes-helm

    asdf-vm
  ];
}

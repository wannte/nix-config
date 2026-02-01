{pkgs, ...}: {
  home.packages = with pkgs; [
    # utils
    jq # A lightweight and flexible command-line JSON processor
    fzf # A command-line fuzzy finder

    awscli2
    saml2aws

    k9s
    kubectl
    kubectx
    kubernetes-helm
  ];
}

{
  pkgs,
  infra-scripts,
  ...
}: let
  vaultSign = pkgs.stdenv.mkDerivation {
    pname = "vault-sign";
    version = "0.1";
    src = infra-scripts;
    nativeBuildInputs = [pkgs.makeWrapper];
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out/bin
      cp $src/basics/sign $out/bin/sign
      chmod +x $out/bin/sign
      wrapProgram $out/bin/sign \
        --prefix PATH : ${pkgs.lib.makeBinPath [
        pkgs.vault
        pkgs.jq
        pkgs.fzf
        pkgs.openssh
      ]}
    '';
  };
in {
  home.packages = [
    pkgs.vault
    vaultSign
  ];

  programs.zsh.envExtra = ''
    export VAULT_ADDR=https://vault.devsisters.cloud
  '';
}

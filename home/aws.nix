{pkgs, ...}: {
  programs.zsh.plugins = [
    {
      name = "aws-autocomplete";
      src = "${pkgs.awscli2}/bin/";
      file = "aws_zsh_completer.sh";
    }
  ];
}

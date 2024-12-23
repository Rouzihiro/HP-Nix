{ config, ... }: 
let
  inherit (config.var) git_email git_username;
in 
{
  ## Allowed Signers file for Git
home.file.".ssh/allowed_signers".text = "* ${builtins.readFile /home/rey/.ssh/HP-Nixo.pub}";

  # Git
  programs.git = {
    enable = true;
    userName = "Rouzihiro";
    userEmail = "ryossj@gmail.com";

    extraConfig = {
      commit.gpgsign = true;
      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };
      user.signingkey = "~/.ssh/HP-Nixo.pub";
    };
  };
}


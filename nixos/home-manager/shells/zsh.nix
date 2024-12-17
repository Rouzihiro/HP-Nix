{ pkgs, ... }:
let
  myAliases = {
    la = "eza --icons -l -T -L=1";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "disfetch";
    fetch = "disfetch";
    gitfetch = "onefetch";
    "," = "comma";
    hypr-config = "nvim ~/.config/hypr/keybinds.conf";
    ls = "ls -la";
    lst = "ls --tree";
    neodir = "cd ~/.config/nvim";
    v = "nvim";
    sv = "sudo nvim";
    #zsource = "source ~/.zshrc";
    zconfig = "v ~/dotfiles/nixos/home-manager/shells/zsh.nix";
    home-config = "nvim ~/dotfiles/nixos/home.nix";
    hlog = "journalctl -u hyprland --since '10 minutes ago'";
    xx = "exit";
    ll = "eza -lh --icons --grid --group-directories-first";
    ".." = "cd ..";
    cls = "clear";
    md = "mkdir";
    hupdate = "home-manager switch";
    nix-update = "sudo nixos-rebuild switch";
    crp = "rsync -ah --progress";
  };
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    #oh-my-zsh = {
    #  enable = true;
    #  plugins = [ "git" "thefuck" ];
    #  theme = "robbyrussell";
    #};
    shellAliases = myAliases;
    initExtra = ''
      fastfetch
      if [ -f $HOME/.zshrc-personal ]; then
        source $HOME/.zshrc-personal
      fi
     export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
     export PATH="$HOME/scripts:$PATH"
    '';
     history = {
      size = 10000;
    }; 
  };

   programs.direnv.nix-direnv.enable = true;

}

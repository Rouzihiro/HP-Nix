{ ... }:
let
  myAliases = {
    ls = "eza --icons --grid --all --color=always";
    la = "eza --icons -l -T -L=1";
    cat = "bat";
    hypr-config = "nvim ~/.config/hypr/keybinds.conf";
    v = "nvim";
    sv = "sudo nvim";
    zsource = "source ~/.zshrc";
    zconfig = "v ~/dotfiles/home-manager/shells/zsh.nix";
    hconfig = "nvim ~/dotfiles/hosts/HP/home.nix";
    #hlog = "journalctl -u hyprland --since '10 minutes ago'";
    xx = "exit";
    cd = "z";
    ".." = "cd ..";
    "..." = "cd ../..";
    ".3" = "cd ../../..";
    ".4" = "cd ../../../..";
    ".5" = "cd ../../../../..";
    md = "mkdir -pv";
    HP = "sudo nixos-rebuild switch --flake .#HP";
    Gaming = "sudo nixos-rebuild switch --flake .#Gaming";
    crp = "rsync -ah --progress";
    clean = "sudo nix-collect-garbage -d && sudo nix-env --delete-generations old";
    wipe = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system";
    rm = "rm -Ivr";
    mv = "mv -iv";
    cp = "xcp -vr";
    c = "clear";
    df = "duf -hide special";
    mem = "free -h";
    ko = "pkill";
  };
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion = { enable = true; };
    syntaxHighlighting = { enable = true; };
    #oh-my-zsh = {
    #  enable = true;
    #  plugins = [ "git" "thefuck" ];
    #  theme = "robbyrussell";
    #};
    sessionVariables = {
        #DIRENV_LOG_FORMAT = "";
        PROMPT_EOL_MARK = "󱞥";
      };
    shellAliases = myAliases;
    initExtra = ''
      # Start SSH agent and add key
      if ! pgrep -u $USER ssh-agent > /dev/null; then
      eval "$(ssh-agent -s)"
      ssh-add ~/.ssh/HP-Nixo
      fi
        export STARSHIP_CONFIG="$HOME/.config/starship.toml"
        if command -v starship &> /dev/null; then
          eval "$(starship init zsh)"
        fi
       export PATH="$HOME/scripts:$PATH"
       export GPG_TTY=$(tty)
    '';
    history = { size = 10000; };
  };

  programs.direnv.nix-direnv.enable = true;

}

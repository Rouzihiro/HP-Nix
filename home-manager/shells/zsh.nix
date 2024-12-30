{ editor, host, ... }:
let
  myAliases = {
    ls = "eza --icons --grid --all --color=always";
    la = "eza --icons -l -T -L=1";
    cat = "bat";
    v = "nvim";
    sv = "sudo nvim";
    zsource = "source ~/.zshrc";
    g = "git";
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
    h = "history | fzf";
    edithome = "cd ~/dotfiles/ && ${editor} hosts/${host}/home.nix hosts/${host}/home-essentials.nix";
    editsys = "cd ~/dotfiles/ && ${editor} system/system-essentials.nix flake.nix";
    editshell = "v ~/dotfiles/home-manager/shells/zsh.nix";
    edithypr = "nvim ~/.config/hypr/keybinds.conf";
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

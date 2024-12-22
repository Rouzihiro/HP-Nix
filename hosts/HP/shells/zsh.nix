{ config, ... }:
let
  myAliases = {
    ls = "eza --icons --grid --all --color=always";
    la = "eza --icons -l -T -L=1";
    cat = "bat";
    "," = "comma";
    hypr-config = "nvim ~/.config/hypr/keybinds.conf";
    neodir = "cd ~/.config/nvim";
    v = "nvim";
    sv = "sudo nvim";
    zsource = "source ~/.zshrc";
    zconfig = "v ~/dotfiles/nixos/home-manager/shells/zsh.nix";
    hconfig = "nvim ~/dotfiles/nixos/home.nix";
    hlog = "journalctl -u hyprland --since '10 minutes ago'";
    xx = "exit";
    ".." = "cd ..";
    cls = "clear";
    md = "mkdir";
    #hupdate = "home-manager switch";
    #nupdate = "sudo nixos-rebuild switch";
    HP = "sudo nixos-rebuild switch --flake .#$HP";
    REY = "home-manager switch --flake .#rey";  
    crp = "rsync -ah --progress";

  ga="git add .";            # Stage all changes
  gc="git commit -m";        # Commit with a message
  #gca="git commit --amend";  # Amend the last commit
  gp="git push origin main";  # Push changes
  gpl="git pull";            # Pull latest changes
  gst="git status";          # Show git status
  gsb="git checkout";        # Switch branches
  gcb="git checkout -b";     # Create a new branch
  gsc="git diff";             # Show changes
  gss="git diff --staged";   # Show staged changes
  gl="git log --oneline --graph --all --decorate";  # Pretty log
  #gcl="git clone";           # Clone a repo
  #gr="git restore";          # Restore changes in working directory
  #grs="git restore --staged"; # Unstage changes
  #grb="git rebase";          # Start a rebase
  #grbi="git rebase -i";      # Interactive rebase
  #gb="git branch";           # List branches
  #gba="git branch -a";       # List all branches (local + remote)
  #gm="git merge";            # Merge branches
  #gs???="git stash save";      # Stash changes
  #gsp="git stash pop";       # Apply stashed changes
  #gsa="git stash apply";     # Apply without removing from stash
  #gsl="git stash list";      # List stashes
  #gsta="git stash drop";     # Drop a stash
  #gpr="git pull --rebase";   # Pull with rebase

  };
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
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
    # Start SSH agent and add key
    if ! pgrep -u $USER ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    fi
      #fastfetch
      #if [ -f $HOME/.zshrc-personal ]; then
      #  source $HOME/.zshrc-personal
      #fi
      # Set STARSHIP_CONFIG environment variable
      export STARSHIP_CONFIG="$HOME/.config/starship.toml"
      # Initialize Starship prompt
      if command -v starship &> /dev/null; then
        eval "$(starship init zsh)"
      fi
     export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
     export PATH="$HOME/scripts:$PATH"
     export GPG_TTY=$(tty)
    '';
     history = {
      size = 10000;
    }; 
  };

   programs.direnv.nix-direnv.enable = true;

}

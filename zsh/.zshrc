echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >>! ~/.zshrc

# Initialize Starship prompt
eval "$(starship init zsh)"

# History Configuration
HISTFILE=$HOME/.zhistory       # File to save history
SAVEHIST=1000                  # Max number of history entries to save
HISTSIZE=999                   # Max number of entries in history
setopt share_history           # Share history across all sessions
setopt hist_expire_dups_first  # Expire duplicate entries first when trimming history
setopt hist_ignore_dups        # Ignore duplicate entries
setopt hist_verify             # Prompt for confirmation before executing history commands


#RUN THIS COMMAND !!! to find the location
#find /nix/store -name zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-autosuggestions.zsh

#RUN THIS COMMAND !!! to find the location
# find /nix/store -name zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -Uz compinit
compinit

# Set environment variables
export scripts="$HOME/scripts"      # Path to your scripts folder
export host="rey"         # Replace with your actual hostname
export username="rey"     # Replace with your actual username
export PATH="$HOME/scripts:$PATH"

# Enable some helpful zsh options
setopt autocd
setopt correct
setopt auto_pushd

## Universal
alias i3config="nvim ~/.config/i3/config"
#alias swayconfig="nvim ~/.config/sway/config"
#alias qconfig="nvim ~/.config/qtile/config.py"
#alias polyconfig="nvim ~/.config/polybar/config.ini"
alias wayconfig="nvim ~/.config/waybar/config.ini"
alias fetchconfig="nvim ~/.config/neofetch/config.conf"
alias kitconfig="nvim ~/.config/kitty/kitty.conf"
alias hconfig="nvim ~/.config/hypr/keybinds.conf"
alias ls="eza --icons --all"
alias la="ls -la"
alias lst="ls --tree"
alias neodir="cd ~/.config/nvim"
alias sv="sudoedit"
alias v="nvim"
alias zsource="source ~/.zshrc"
alias zconfig="v ~/.zshrc"
alias config="v ~/dotfiles/nixos/configuration.nix"

alias xx="exit"
#alias ai="tgpt"
#alias gg="fg"
alias ins='nvim $(fzf -m --preview="bat --theme=gruvbox-dark --color=always {}")'

# Aliases for ease of use
alias cat="bat"
alias ll="eza -lh --icons --grid --group-directories-first"
#alias la="eza -lah --icons --grid --group-directories-first"
alias ".."="cd .."
alias cls="clear"
alias md="mkdir"

alias update='sudo nixos-rebuild switch'   
alias crp='rsync -ah --progress'

# Set up PATH for local scripts
export PATH="$HOME/.local/bin:$PATH"
#export PATH=$PATH:/snap/bin


# Set default editor to nvim
export VISUAL="nvim"
export EDITOR="nvim"


POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

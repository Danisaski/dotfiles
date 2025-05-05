# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
    
# Enable plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source the plugins
source $ZSH/oh-my-zsh.sh

# Initialize starship
eval "$(starship init zsh)"

# Activate Python venv on startup
source ~/code/python/venvs/denv/bin/activate

# Add cargo to path
source "$HOME/.cargo/env"

# Automatically start Tmux on terminal open
if [[ -z "$TMUX" ]]; then
    tmux
fi

# Always start in the home directory
cd ~

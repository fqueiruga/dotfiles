# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Set up autocomplete
autoload -Uz compinit
compinit

# Configure starship zsh theme
eval "$(starship init zsh)"

# ZSHrc extra config
ZSHRC_DIR="$HOME/.config/zshrc.d"
function load_zshrc_config {
	for conf in "$ZSHRC_DIR/"*.zsh; do
  		source "${conf}"
	done
	unset conf
}
[ -d $ZSHRC_DIR ] && load_zshrc_config

# Configure NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


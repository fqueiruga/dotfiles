#!/bin/zsh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
#if test ! $(command -v brew &> /dev/null); then
#  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
#  eval "$(/opt/homebrew/bin/brew shellenv)"
#fi

# Run install scripts
source $DOTFILES/scripts/nmv_install.zsh

function apply_symlinks {
	target_file=${2:-$1}
	rm -rf $HOME/$target_file
	ln -s $HOME/.dotfiles/$1 $HOME/$target_file
}

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
apply_symlinks ".zshrc"

apply_symlinks ".gitconfig"

apply_symlinks "config/starship.toml" ".config/starship.toml"

#rm -rf $HOME/.zshrc
#ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc


# Update Homebrew recipes
#brew update

# Install all our dependencies with bundle (See Brewfile)
#brew tap homebrew/bundle
brew bundle install --file $DOTFILES/Brewfile

# Load configuration
source $HOME/.zshrc

# Run postinstall scripts
source $DOTFILES/scripts/nvm_postinstall.zsh


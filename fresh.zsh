#!/bin/zsh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
#if test ! $(command -v brew &> /dev/null); then
#  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
#  eval "$(/opt/homebrew/bin/brew shellenv)"
#fi

function apply_symlinks {
	rm -rf $HOME/$1
	ln -s $HOME/.dotfiles/$1 $HOME/$1
}

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
apply_symlinks ".zshrc"

# Removes .gitconfig from $HOME (if it exists) and symlinks the .gitconfig file from the .dotfiles
apply_symlinks ".gitconfig"
#rm -rf $HOME/.zshrc
#ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc


# Update Homebrew recipes
#brew update

# Install all our dependencies with bundle (See Brewfile)
#brew tap homebrew/bundle
brew bundle install --file $DOTFILES/Brewfile


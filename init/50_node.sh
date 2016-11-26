# Load nave- and npm-related functions.
source $DOTFILES/source/50_node.sh

# Install latest stable Node.js, set as default, install global npm modules.
# nave_install stable
nave_install 4.6.2
nave_install 6.9.1
nave_default 6.9.1

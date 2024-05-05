#!/bin/bash

config() {
  git --git-dir="${HOME}"/.config/ --work-tree="${HOME}" "$@"
}

# Install config
git clone --bare https://github.com/voinskiv/config.git ~/.config
config checkout
config config --local status.showUntrackedFiles no

# Hide config files
chflags hidden "$(config ls-files)"

# Set Bash settings
source ~/.bash_profile

# Set macOS settings
source ~/.macos

# Install Homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Homebrew packages
brew bundle install

echo "Done"

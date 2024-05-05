#!/bin/bash

config() {
  git --git-dir="${HOME}"/.config/ --work-tree="${HOME}" "$@"
}

# Install config
git clone --bare https://github.com/voinskiv/config.git ~/.config
config checkout
config config --local status.showUntrackedFiles no

chflags hidden "$(config ls-files)"

source ~/.bash_profile

# Install Homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Homebrew packages
brew bundle install

# Set macOS settings
source ~/.macos

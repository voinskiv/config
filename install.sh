#!/bin/zsh
#
# Install config, Homebrew with packages and set settings.

config() {
  git --git-dir="${HOME}"/.config/ --work-tree="${HOME}" "$@"
}

git clone --bare https://github.com/voinskiv/config.git ~/.config
config checkout
config config --local status.showUntrackedFiles no

config ls-files | xargs chflags hidden

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle install

source ~/.zshrc
source ~/.macos

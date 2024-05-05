#!/bin/bash

config() {
  git --git-dir="${HOME}"/.config/ --work-tree="${HOME}" "$@"
}

git clone --bare https://github.com/voinskiv/config.git ~/.config
config checkout
config config --local status.showUntrackedFiles no

chflags hidden "$(config ls-files)"

source ~/.bash_profile

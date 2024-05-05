#!/bin/bash

git clone --bare https://github.com/voinskiv/config.git ~/.config
git --git-dir="$HOME"/.config/ --work-tree="$HOME" checkout
git --git-dir="$HOME"/.config/ --work-tree="$HOME" config --local status.showUntrackedFiles no
chflags hidden "$(config ls-files)"
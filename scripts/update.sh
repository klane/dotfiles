#!/usr/bin/env bash
# get repo location
DIR="${BASH_SOURCE%/*/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

. $DIR/scripts/support.sh # load support functions & variables

gecho 'Update Homebrew'
brew update

gecho 'Upgrade outdated brews and casks'
brew upgrade
brew cask upgrade

gecho 'Cleanup brew cached downloads'
brew cleanup
brew prune

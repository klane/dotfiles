#!/usr/bin/env bash

# update Homebrew
brew update

# upgrade outdated brews and casks
brew upgrade
brew cask upgrade

# cleanup brew cached downloads
brew cleanup
brew prune

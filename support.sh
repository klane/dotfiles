#!/usr/bin/env bash
function gecho() {
    GREEN="$(tput setaf 2; tput bold)"
    RESET="$(tput sgr0)"
    echo "${GREEN}$1${RESET}"
}

function is_windows() {
    [[ $OSTYPE == msys ]] || return 1
}

DIR=~/project/dotfiles
REPO=klane/dotfiles.git

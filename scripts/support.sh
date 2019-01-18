#!/usr/bin/env bash
function gecho() {
    GREEN="$(tput setaf 2; tput bold)"
    RESET="$(tput sgr0)"
    echo "${GREEN}$1${RESET}"
}

function is_windows() {
    [[ $OSTYPE == msys ]] || return 1
}

EMAIL=lane.kevin.a@gmail.com
REPO=klane/dotfiles.git

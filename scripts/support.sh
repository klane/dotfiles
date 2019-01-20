#!/usr/bin/env bash
function exists() {
    command -v "$1" >/dev/null 2>&1
}

function gecho() {
    GREEN="$(tput setaf 2; tput bold)"
    RESET="$(tput sgr0)"
    echo "${GREEN}$1${RESET}"
}

function is_windows() {
    [[ $OSTYPE == msys ]] || return 1
}

function prompt() {
    read -r -p "$1 [y|N] " response
    [[ $response =~ (yes|y|Y) ]] || return 1
}

EMAIL=lane.kevin.a@gmail.com
REPO=klane/dotfiles.git

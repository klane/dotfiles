#!/usr/bin/env bash
function gecho() {
    GREEN="$(tput setaf 2; tput bold)"
    RESET="$(tput sgr0)"
    echo "${GREEN}$1${RESET}"
}

function is_windows() {
    [[ ${OSTYPE,,} == msys ]] || return 1
}

cd ~ # ensure installation starts in the home directory
DIR=~/project/dotfiles
FISHDIR=~/.config/fish
REPO=https://github.com/klane/dotfiles.git

gecho 'Updating installed packages'
pacman -Su --noconfirm

gecho 'Installing development packages'
pacman -S msys2-devel libcrypt-devel --noconfirm

gecho 'Installing desired packages'
pacman -S fish git python3 python3-pip rsync zsh --noconfirm

gecho 'Copying .gitconfig'
curl -O https://raw.githubusercontent.com/klane/dotfiles/master/.gitconfig

gecho 'Cloning repository'
git clone $REPO $DIR/

gecho 'Linking files'
rsync -a --exclude-from="$DIR/rsync-exclude.txt" --link-dest=$DIR $DIR/ ~
if is_windows; then
    ln $DIR/.minttyrc ~
    ln $DIR/.gitconfig $USERPROFILE/.gitconfig # link to Windows home directory
fi

if is_windows; then
    gecho 'Installing direnv'
    DIRENV_REPO=https://github.com/direnv/direnv/releases/download/v2.17.0
    DIRENV=/usr/local/bin/direnv.exe
    curl -Lo $DIRENV --create-dirs "$DIRENV_REPO/direnv.windows-amd64.exe"
    chmod +x $DIRENV
fi

gecho 'Installing fisherman'
curl -Lo $FISHDIR/functions/fisher.fish --create-dirs https://git.io/fisher

gecho 'Installing fish plugins'
fish -c 'fisher'
echo 'eval (pipenv --completion)' > $FISHDIR/completions/pipenv.fish

gecho 'Upgrading pip'
pip install --upgrade pip

gecho 'Installing Python packages'
pip install -r $DIR/requirements.txt

gecho 'Installing Powerline fonts'
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

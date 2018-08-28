#!/usr/bin/env bash
function gecho() {
    GREEN="$(tput setaf 2; tput bold)"
    RESET="$(tput sgr0)"
    echo "${GREEN}$1${RESET}"
}

function is_windows() {
    [[ ${OSTYPE,,} =~ cygwin ]] || return 1
}

cd ~ # ensure installation starts in the home directory
DIR=./project/dotfiles # use . instead of ~ to avoid path issue in Cygwin
FISHDIR=~/.config/fish
REPO=https://github.com/klane/dotfiles.git

gecho 'Copying .gitconfig'
curl -O https://raw.githubusercontent.com/klane/dotfiles/master/.gitconfig

gecho 'Cloning repository'
if is_windows; then
    /cygdrive/c/ProgramData/scoop/shims/git clone $REPO $DIR/
else
    git clone $REPO $DIR/
fi

gecho 'Linking files'
rsync -a --exclude-from="$DIR/rsync-exclude.txt" --link-dest=$DIR $DIR/ ~
if is_windows; then
    rsync -a --link-dest=$DIR $DIR/.minttyrc ~
    ln $DIR/.gitconfig $USERPROFILE/.gitconfig
fi

if is_windows; then
    gecho 'Installing direnv'
    DIRENV_VERSION=v2.16.0
    DIRENV=/usr/local/bin/direnv.exe
    curl -Lo $DIRENV "https://github.com/direnv/direnv/releases/download/"\
                     "$DIRENV_VERSION/direnv.windows-amd64.exe"
    chmod +x $DIRENV
fi

gecho 'Installing fisherman and fish plugins'
curl -Lo $FISHDIR/functions/fisher.fish --create-dirs https://git.io/fisher
fish -c 'fisher'
echo 'eval (pipenv --completion)' > $FISHDIR/completions/pipenv.fish

gecho 'Upgrading pip and installing Python packages'
python3 -m pip install --upgrade pip
pip install -r $DIR/requirements.txt

gecho 'Installing Powerline fonts'
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
dos2unix install.sh
./install.sh
cd ..
rm -rf fonts

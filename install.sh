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
REPO=klane/dotfiles.git

if is_windows; then
    gecho 'Updating installed packages'
    pacman -Su --noconfirm

    gecho 'Installing desired packages'
    pacman -S diffutils fish openssh rsync tar zsh --noconfirm

    export PATH=$PATH:/c/Users/$USER/scoop/shims
    export PATH=$PATH:/c/Users/$USER/scoop/apps/python/current/Scripts
fi

gecho 'Copying .gitconfig'
curl -O https://raw.githubusercontent.com/klane/dotfiles/master/.gitconfig

gecho 'Cloning repository'
git clone https://github.com/$REPO $DIR/

gecho 'Linking files'
rsync -a --exclude-from="$DIR/rsync-exclude.txt" --link-dest=$DIR $DIR/ ~
if is_windows; then
    ln $DIR/.minttyrc ~
fi

gecho 'Generating SSH key'
ssh-keygen -t rsa -b 4096 -C 'lane.kevin.a@gmail.com' -f ~/.ssh/github.key
eval $(ssh-agent -s)
ssh-add ~/.ssh/github.key
git --git-dir $DIR/.git remote set-url origin git@github.com:$REPO

if is_windows; then
    gecho 'Installing direnv'
    DIRENV_REPO=https://github.com/direnv/direnv/releases/download/v2.16.0
    DIRENV=/usr/local/bin/direnv.exe
    curl -Lo $DIRENV --create-dirs "$DIRENV_REPO/direnv.windows-amd64.exe"
    chmod +x $DIRENV
fi

gecho 'Installing fisherman'
FISHDIR=~/.config/fish
curl -Lo $FISHDIR/functions/fisher.fish --create-dirs https://git.io/fisher

gecho 'Installing fish plugins'
fish -c 'fisher'
echo 'eval (pipenv --completion)' > $FISHDIR/completions/pipenv.fish

gecho 'Upgrading pip'
if is_windows; then
    python -m pip install --upgrade pip
else
    pip install --upgrade pip
fi

gecho 'Installing Python packages'
pip install -r $DIR/requirements.txt
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
poetry completions fish > ~/.config/fish/completions/poetry.fish
poetry config settings.virtualenvs.in-project true

gecho 'Installing Powerline fonts'
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

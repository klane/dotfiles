#!/usr/bin/env bash
# get repo location
DIR="${BASH_SOURCE%/*/*}"
if [[ ! -d "$DIR" ]]; then DIR="${PWD%/*}"; fi

. $DIR/scripts/support.sh # load support functions & variables
cd ~ # ensure installation starts in the home directory

FISHDIR=~/.config/fish
mkdir -p $FISHDIR/completions

if is_windows; then
    gecho 'Updating installed packages'
    pacman -Su --noconfirm

    gecho 'Installing desired packages'
    pacman -S diffutils fish openssh rsync tar zsh --noconfirm

    export PATH=$PATH:/c/Users/$USER/scoop/shims
    export PATH=$PATH:/c/Users/$USER/scoop/apps/python/current/Scripts
fi

gecho 'Linking files'
source $DIR/scripts/bootstrap.sh

if ! is_windows; then
    if ! exists brew; then
        gecho 'Installing Homebrew'
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    gecho 'Installing desired packages'
    brew bundle
    PYENV_DIR=~/.pyenv/versions
    ln -s $(brew --cellar python)/* $PYENV_DIR/homebrew
    ln -s $PYENV_DIR/homebrew/libexec/bin/* $PYENV_DIR/homebrew/bin
fi

gem install colorls

if prompt 'Generate SSH key?'; then
    gecho 'Generating SSH key'
    ssh-keygen -t rsa -b 4096 -C $EMAIL -f ~/.ssh/github.key
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/github.key
    git --git-dir $DIR/.git remote set-url origin git@github.com:$REPO
fi

if prompt 'Generate GPG key?'; then
    gpg --full-generate-key
    echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
fi

if is_windows && prompt 'Install direnv?'; then
    gecho 'Installing direnv'
    DIRENV_REPO=https://github.com/direnv/direnv/releases/download/v2.16.0
    DIRENV=/usr/local/bin/direnv.exe
    curl -Lo $DIRENV --create-dirs "$DIRENV_REPO/direnv.windows-amd64.exe"
    chmod +x $DIRENV
fi

if prompt 'Install fisherman and fish plugins?'; then
    gecho 'Installing fisherman'
    curl -Lo $FISHDIR/functions/fisher.fish --create-dirs https://git.io/fisher

    gecho 'Installing fish plugins'
    fish -c 'fisher'
fi

if prompt 'Upgrade pip?'; then
    gecho 'Upgrading pip'
    if is_windows; then
        python -m pip install --upgrade pip
    else
        pip install --upgrade pip
    fi
fi

if is_windows && prompt 'Install Python packages?'; then
    gecho 'Installing Python packages'
    pip install -r $DIR/support/requirements.txt
fi

if exists pipenv; then
    echo 'eval (pipenv --completion)' > $FISHDIR/completions/pipenv.fish
fi

if prompt 'Install poetry?'; then
    gecho 'Installing poetry'
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
    poetry config settings.virtualenvs.in-project true
    poetry completions fish > $FISHDIR/completions/poetry.fish
    mkdir -p ~/.zfunc && poetry completions zsh > ~/.zfunc/_poetry
fi

if is_windows && prompt 'Install Powerline fonts?'; then
    gecho 'Installing Powerline fonts'
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
fi

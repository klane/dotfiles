#!/usr/bin/env bash
gecho () {
    GREEN="$(tput setaf 2; tput bold)"
    RESET="$(tput sgr0)"
    echo "${GREEN}$1${RESET}"
}

cd ~ # ensure installation starts in the home directory

DIR=./project/dotfiles
FISHDIR=./.config/fish
FISHCMPL=$FISHDIR/completions
OSLOW=$(echo $OS | awk '{print tolower($0)}')
REPO=https://github.com/klane/dotfiles.git
GITCONFIG=https://raw.githubusercontent.com/klane/dotfiles/master/.gitconfig

gecho 'Creating directories'
[ ! -d project ] && mkdir project
[ ! -d $FISHCMPL ] && mkdir -p $FISHCMPL

gecho 'Copying .gitconfig'
wget --no-hsts $GITCONFIG

gecho 'Cloning repository'
cd project
if [[ $OSLOW == *windows* ]]; then
    /cygdrive/c/ProgramData/scoop/shims/git clone $REPO
else
    git clone $REPO
fi
cd ~
rm .gitconfig

gecho 'Linking files'
#TODO use rsync instead
ln $DIR/.gitconfig ~
ln $DIR/.zshrc ~
ln $DIR/config.fish $FISHDIR
echo 'eval (pipenv --completion)' > $FISHCMPL/pipenv.fish

if [[ $OSLOW == *windows* ]]; then
    ln $DIR/.minttyrc ~
fi

# install Python packages
gecho 'Upgrading pip and installing Python packages'
python3 -m pip install --upgrade pip
pip install -r $DIR/requirements.txt

# install Powerline fonts
gecho 'Installing Powerline fonts'
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
dos2unix install.sh
./install.sh
cd ..
rm -rf fonts

# install fisherman
gecho 'Installing fisherman and setting fish theme'
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fish -c 'fisher omf/theme-agnoster'

#!/usr/bin/env bash
gecho () {
    GREEN="$(tput setaf 2; tput bold)"
    RESET="$(tput sgr0)"
    echo "${GREEN}$1${RESET}"
}

DIR=~/project/dotfiles
FISHDIR=~/.config/fish
FISHCMPL=$FISHDIR/completions

gecho 'Creating directories'
[ ! -d project ] && mkdir project
[ ! -d $FISHCMPL ] && mkdir -p $FISHCMPL

gecho 'Cloning repository'
cd project
git clone https://github.com/klane/dotfiles.git
cd ~

gecho 'Linking files'
ln -s $DIR/.zshrc ~
ln -s $DIR/config.fish $FISHDIR
echo "eval (pipenv --completion)" > $FISHCMPL/pipenv.fish

# if [ "$(uname)" == "Darwin" ]; then
    # install homebrew
    # link Mac-specific files
# else
    # assume Windows
ln -s $DIR/.minttyrc ~
# fi

# install Python packages
gecho 'Upgrading pip and installing Python packages'
python -m pip install --upgrade pip
pip install -r $DIR/requirements.txt

# install Powerline fonts
gecho 'Installing Powerline fonts'
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# install fisherman
gecho 'Installing fisherman and setting fish theme'
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fish -c 'fisher omf/theme-agnoster'

#!/usr/bin/env bash
gecho () {
    GREEN="$(tput setaf 2; tput bold)"
    RESET="$(tput sgr0)"
    echo "${GREEN}$1${RESET}"
}

DIR=~/project/dotfiles
FISHDIR=~/.config/fish/completions
OSLOW=$(echo $OS | awk '{print tolower($0)}')
REPO=https://github.com/klane/dotfiles.git
GITCONFIG=https://raw.githubusercontent.com/klane/dotfiles/master/.gitconfig

gecho 'Creating directories'
[ ! -d project ] && mkdir project
[ ! -d $FISHDIR ] && mkdir -p $FISHDIR

gecho 'Copying .gitconfig'
wget --no-hsts -O ~/.gitconfig $GITCONFIG

gecho 'Cloning repository'
if [[ $OSLOW == *windows* ]]; then
    REPODIR=/cygwin$DIR # account for Windows program paths
    /cygdrive/c/ProgramData/scoop/shims/git clone $REPO $REPODIR/
else
    REPODIR=$DIR
    git clone $REPO $REPODIR/
fi

gecho 'Linking files'
rsync -a --exclude-from="$DIR/rsync-exclude.txt" --link-dest=$DIR $DIR/ ~
echo 'eval (pipenv --completion)' > $FISHDIR/pipenv.fish

if [[ $OSLOW == *windows* ]]; then
    rsync -a --link-dest=$DIR $DIR/.minttyrc ~
fi

# install Python packages
gecho 'Upgrading pip and installing Python packages'
python3 -m pip install --upgrade pip
pip install -r $REPODIR/requirements.txt

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

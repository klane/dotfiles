#!/usr/bin/env bash
gecho () {
    GREEN="$(tput setaf 2; tput bold)"
    RESET="$(tput sgr0)"
    echo "${GREEN}$1${RESET}"
}

cd ~ # ensure installation starts in the home directory
DIR=./project/dotfiles # use . instead of ~ to avoid path issue in Cygwin
OSLOW=$(echo $OS | awk '{print tolower($0)}')
REPO=https://github.com/klane/dotfiles.git
GITCONFIG=https://raw.githubusercontent.com/klane/dotfiles/master/.gitconfig

gecho 'Copying .gitconfig'
wget --no-hsts -O ~/.gitconfig $GITCONFIG

gecho 'Installing fisherman and fish plugins'
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fish -c 'fisher omf/theme-agnoster pipenv'

gecho 'Cloning repository'
if [[ $OSLOW == *windows* ]]; then
    /cygdrive/c/ProgramData/scoop/shims/git clone $REPO $DIR/
else
    git clone $REPO $DIR/
fi

gecho 'Linking files'
rsync -a --exclude-from="$DIR/rsync-exclude.txt" --link-dest=$DIR $DIR/ ~
echo 'eval (pipenv --completion)' > ~/.config/fish/completions/pipenv.fish
if [[ $OSLOW == *windows* ]]; then
    rsync -a --link-dest=$DIR $DIR/.minttyrc ~
    ln $DIR/.gitconfig $USERPROFILE/.gitconfig
fi

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

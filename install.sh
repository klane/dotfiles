DIR=~/project/dotfiles
FISHDIR=~/.config/fish
FISHCMPL=$FISHDIR/completions

[ ! -d $DIR ] && mkdir -p $DIR
[ ! -d $FISHDIR ] && mkdir -p $FISHDIR
[ ! -d $FISHCMPL ] && mkdir $FISHCMPL

git clone https://github.com/klane/dotfiles.git $DIR
cd $DIR

ln -s .zshrc ~
ln -s config.fish $FISHDIR
echo "eval (pipenv --completion)" > $FISHCMPL/pipenv.fish

if [ "$(uname)" == "Darwin" ]; then
    # install homebrew
	# link Mac-specific files
else # assume Windows
    ln -s .minttyrc ~
fi

# return to home directory
cd ~

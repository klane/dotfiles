DIR=~/project/dotfiles
FISHDIR=~/.config/fish
FISHCMPL=$FISHDIR/completions

[ ! -d $DIR ] && mkdir -p $DIR
[ ! -d $FISHDIR ] && mkdir -p $FISHDIR
[ ! -d $FISHCMPL ] && mkdir $FISHCMPL

git clone https://github.com/klane/dotfiles.git $DIR

ln -s $DIR/.zshrc ~
ln -s $DIR/config.fish $FISHDIR
echo "eval (pipenv --completion)" > $FISHCMPL/pipenv.fish

if [ "$(uname)" == "Darwin" ]; then
    # install homebrew
	# link Mac-specific files
else # assume Windows
    ln -s $DIR/.minttyrc ~
fi

# install Python packages
pip install -r $DIR/requirements.txt

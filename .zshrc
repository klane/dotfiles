# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/Kev/.zshrc'

fpath+=~/.zfunc

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
bindkey -e
# End of lines configured by zsh-newuser-install

#export PATH=/cygdrive/c/Users/$USER/scoop/shims:$PATH
export PATH=/cygdrive/c/Users/$USER/scoop/apps/python/current:$PATH
export PATH=/cygdrive/c/Users/$USER/scoop/apps/python/current/Scripts:$PATH
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme.
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

# Configure Pipenv
eval "$(pipenv --completion)"
export PIPENV_VENV_IN_PROJECT=1

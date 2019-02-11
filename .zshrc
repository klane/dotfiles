# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '~/.zshrc'

fpath+=~/.zfunc

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
bindkey -e
# End of lines configured by zsh-newuser-install

case uname in
    Darwin)
        export PATH="/usr/local/sbin:$PATH"
        export PATH=/usr/local/opt/python/libexec/bin:$PATH
        export PATH="$HOME/.poetry/bin:$PATH"
        ;;
    *)
        export PATH=/cygdrive/c/Users/$USER/scoop/shims:$PATH
        export PATH=/cygdrive/c/Users/$USER/scoop/apps/python/current:$PATH
        export PATH=/cygdrive/c/Users/$USER/scoop/apps/python/current/Scripts:$PATH
        ;;
esac

# Configure Pipenv
eval "$(pipenv --completion)"
export PIPENV_VENV_IN_PROJECT=1

alias git=hub

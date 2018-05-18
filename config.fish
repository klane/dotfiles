switch (string lower $OS)
case "*windows*"
    set PATH /cygdrive/c/Users/$USER/scoop/shims $PATH
    set PATH /cygdrive/c/Users/$USER/scoop/apps/python/current $PATH
    set PATH /cygdrive/c/Users/$USER/scoop/apps/python/current/Scripts $PATH
case '*'

end

set -x SHELL fish

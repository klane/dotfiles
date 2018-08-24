switch (string lower $OS)
case "*windows*"
    set PATH /cygdrive/c/Users/$USER/scoop/shims $PATH
case '*'

end

set -x SHELL fish

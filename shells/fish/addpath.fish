switch (string lower $OS)
case '*windows*'
    set PATH $PATH /c/Users/$USER/scoop/shims
    set PATH $PATH /c/Users/$USER/scoop/apps/oraclejdk8/current/bin
    set PATH $PATH /c/Users/$USER/scoop/apps/python/current/Scripts
case '*'

end

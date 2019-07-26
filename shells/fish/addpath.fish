switch (uname)
    case Darwin
        set PATH /usr/local/sbin $PATH
        set PATH /usr/local/opt/ruby/bin $PATH
        set PATH (gem environment gemdir)/bin $PATH
        set PATH $HOME/.poetry/bin $PATH
    case '*'
        set PATH $PATH /c/Users/$USER/scoop/shims
        set PATH $PATH /c/Users/$USER/scoop/apps/oraclejdk8/current/bin
        set PATH $PATH /c/Users/$USER/scoop/apps/python/current/Scripts
end
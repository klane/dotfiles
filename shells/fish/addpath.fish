switch (uname)
    case Darwin
        set PATH /usr/local/sbin $PATH
        set PATH $HOME/.poetry/bin $PATH
        set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
        set PATH /usr/local/opt/curl/bin $PATH
        set PATH /usr/local/opt/findutils/libexec/gnubin $PATH
        set PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
        set PATH /usr/local/opt/gnu-which/libexec/gnubin $PATH
        set PATH /usr/local/opt/grep/libexec/gnubin $PATH
    case '*'
        set PATH $PATH /c/Users/$USER/scoop/shims
        set PATH $PATH /c/Users/$USER/scoop/apps/oraclejdk8/current/bin
        set PATH $PATH /c/Users/$USER/scoop/apps/python/current/Scripts
end

function ignorehistory --on-event fish_prompt
    set tmp df du fg bg ls la ll history which exit
    echo all | history --delete -p $tmp > /dev/null
end

switch (uname)
    case Darwin
        set PATH /usr/local/sbin $PATH
        set PATH /usr/local/opt/python/libexec/bin $PATH
        set PATH /usr/local/opt/ruby/bin $PATH
        set PATH $HOME/.poetry/bin $PATH
    case '*'
        set PATH $PATH /c/Users/$USER/scoop/shims
        set PATH $PATH /c/Users/$USER/scoop/apps/oraclejdk8/current/bin
        set PATH $PATH /c/Users/$USER/scoop/apps/python/current/Scripts
end

alias df 'df -h'
alias du 'du -h'
alias git hub

set -x PIPENV_VENV_IN_PROJECT true
set -x SHELL fish
set fish_greeting
eval (direnv hook fish)

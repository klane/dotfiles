switch (string lower $OS)
case '*windows*'
    set PATH $PATH /c/Users/$USER/scoop/shims
    set PATH $PATH /c/Users/$USER/scoop/apps/oraclejdk8/current/bin
    set PATH $PATH /c/Users/$USER/scoop/apps/python/current/Scripts
case '*'

end

function ignorehistory --on-event fish_prompt
    echo all | history --delete df du fg bg ls la ll which exit > /dev/null
end

alias df 'df -h'
alias du 'du -h'
alias git hub

set -x PIPENV_VENV_IN_PROJECT true
set -x SHELL fish
set fish_greeting
eval (direnv hook fish)

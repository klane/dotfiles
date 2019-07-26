function ignorehistory --on-event fish_prompt
    set tmp df du fg bg ls la ll history which exit
    echo all | history --delete -p $tmp > /dev/null
end

alias df 'df -h'
alias du 'du -h'
alias git hub
alias lc 'colorls -lA --sd'

set -x PIPENV_VENV_IN_PROJECT true
set -x SHELL fish
set fish_greeting

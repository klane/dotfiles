function ignorehistory --on-event fish_prompt
    set tmp df du fg bg ls la ll history which exit
    echo all | history --delete -p $tmp > /dev/null
end

alias df 'df -h'
alias du 'du -h'
alias git hub
alias gu gitup
alias htop 'htop --delay 10'
alias lc 'exa --all --long --git --group-directories-first --icons'
alias lg lazygit
alias loc 'tokei --sort lines'
alias rgs 'rg --sort=path'
alias tree 'lc --tree'

set -x PIPENV_VENV_IN_PROJECT true
set -x SHELL fish
set -x DOTFILES ~/project/dotfiles
set fish_greeting

# Set prompt
eval (starship init fish)

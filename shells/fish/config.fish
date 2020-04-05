alias df 'df -h'
alias du 'du -h'
alias git hub
alias gu gitup
alias htop 'htop --delay 10'
alias jp 'jump project'
alias lc 'exa --all --long --git --group-directories-first --icons'
alias lg lazygit
alias loc 'tokei --sort lines'
alias rgs 'rg --sort=path'
alias tree 'lc --tree --ignore-glob .git'

set -x DIRENV_WARN_TIMEOUT 10s
set -x PIPENV_VENV_IN_PROJECT true
set -x RIPGREP_CONFIG_PATH ~/.config/ripgreprc
set -x SHELL (brew --prefix)/bin/fish
set -x DOTFILES ~/project/dotfiles
set -x EDITOR subl
set -x FZF_COMPLETE 2

set fish_greeting
set fish_color_command green
set fish_color_error red --bold
set fish_color_search_match --background=blue

abbr -a nb 'jupyter-notebook'
abbr -a lab 'jupyter-lab'

# enable conda
source (conda info --root)/etc/fish/conf.d/conda.fish

# Set prompt
starship init fish | source

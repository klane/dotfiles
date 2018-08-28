switch (string lower $OS)
case '*windows*'
    alias wgit '/cygdrive/c/ProgramData/scoop/shims/git.exe'
case '*'

end

set -x PIPENV_VENV_IN_PROJECT true
set -x SHELL fish

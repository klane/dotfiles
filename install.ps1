# add necessary buckets
#scoop bucket add extras
#scoop bucket add java

# install command line tools
#scoop install 7zip
#scoop install coreutils
#scoop install curl
#scoop install diffutils
#scoop install findutils
#scoop install gawk
#scoop install git
#scoop install gradle
#scoop install grep
#scoop install sed
#scoop install sudo
#scoop install wget
#scoop install which

# install languages
#scoop install openjdk
#scoop install r
#scoop install scala

# install programs
#scoop install atom
#scoop install cmder
#scoop install flux
#scoop install gitkraken
#scoop install jetbrains-toolbox
#scoop install notepadplusplus
#scoop install rstudio
#scoop install slack
#scoop install sqlitebrowser
#scoop install sublime-text
#scoop install vscode

# install MSYS2
scoop install msys2
msys2

# set MSYS2 environment variable
$msys2 = scoop info msys2 | sed -n '/Installed/{n;p}' | tr -d "[:space:]"
[System.Environment]::SetEnvironmentVariable('MSYS2_ROOT', $msys2,
[System.EnvironmentVariableTarget]::User)

# cleanup Scoop cache
scoop cache rm *

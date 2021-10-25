# install scoop
iwr -useb get.scoop.sh | iex

# add necessary buckets
#scoop bucket add extras
#scoop bucket add nerd-fonts
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
#scoop install lazygit
#scoop install sed
#scoop install sudo
#scoop install wget
#scoop install which

# install languages
#scoop install oraclejdk8
scoop install python
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

# set MSYS2 environment variable
$MSYS2_ROOT = scoop info msys2 | sed -n '/Installed/{n;p}' | tr -d "[:space:]"
[System.Environment]::SetEnvironmentVariable('MSYS2_ROOT', $MSYS2_ROOT,
[System.EnvironmentVariableTarget]::User)

# sync MSYS2 and Windows home directories
$MSYS2_HOME = "$MSYS2_ROOT\home\$env:USERNAME"
New-Item -ItemType Junction -Path $MSYS2_HOME -Value $env:USERPROFILE

# start MSYS2 to continue installation
msys2

# cleanup Scoop cache
scoop cache rm *

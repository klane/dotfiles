# set variables
$env:CYGWIN_ROOT = "$env:ChocolateyToolsLocation\cygwin"

# add necessary buckets
#scoop bucket add extras
#scoop bucket add versions

# install common programs
#scoop install ln
#scoop install sudo
#scoop install which
#sudo scoop install 7zip --global
#sudo scoop install git --global

# install languages
#scoop install miniconda3
#scoop install python27
scoop install python
#scoop install r

# install developer tools
#scoop install atom
#scoop install cmder
#scoop install gitkraken
#scoop install jetbrains-toolbox
#scoop install notepadplusplus
#scoop install sourcetree
#scoop install sqlitebrowser
#scoop install sublime-text
#scoop install vscode

# install other programs
sudo choco install cygwin -y
#scoop install flux
#scoop install msys2

# install additional cygwin programs
$CYGWIN_EXE = "$env:CYGWIN_ROOT\cygwinsetup.exe"
$CYGWIN_ARGS = "-n -q -R $env:CYGWIN_ROOT -P curl,fish,fontconfig,wget,zsh"
Start-Process $CYGWIN_EXE -ArgumentList $CYGWIN_ARGS

# run install.sh
cygwin -c 'curl https://raw.githubusercontent.com/klane/dotfiles/master/install.sh | bash'

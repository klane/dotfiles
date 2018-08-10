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
#scoop install flux
#scoop install msys2

# set Cygwin variables
$packages = "curl,dos2unix,fish,fontconfig,git,wget,zsh"
$url = "http://cygwin.mirror.constant.com"
$env:CYGWIN_ROOT = "$env:USERPROFILE\cygwin"
$CYGWIN_EXE = "$env:CYGWIN_ROOT\cygwinsetup.exe"
$CYGWIN_ARGS = "-n -q -R $env:CYGWIN_ROOT -l $env:CYGWIN_ROOT -s $url -P $packages"

# install Cygwin
mkdir $env:CYGWIN_ROOT
Invoke-WebRequest -Uri "https://cygwin.com/setup-x86_64.exe" -OutFile $CYGWIN_EXE
Start-Process $CYGWIN_EXE -ArgumentList $CYGWIN_ARGS
Set-Alias -Name "cygwin" -Value "$env:CYGWIN_ROOT\Cygwin.bat"

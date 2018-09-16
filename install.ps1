# add necessary buckets
#scoop bucket add extras

# install utilities
#scoop install 7zip
#scoop install coreutils
#scoop install curl
#scoop install gawk
#scoop install git
#scoop install grep
#scoop install sed
#scoop install sudo
#scoop install wget
#scoop install which

# install programs
#scoop install atom
#scoop install cmder
#scoop install flux
#scoop install gitkraken
#scoop install jetbrains-toolbox
#scoop install notepadplusplus
#scoop install r
#scoop install rstudio
#scoop install slack
#scoop install sqlitebrowser
#scoop install sublime-text
#scoop install vscode

# set Cygwin variables
$packages = "curl,dos2unix,fish,fontconfig,git,wget,zsh"
$url = "http://cygwin.mirror.constant.com"
$env:CYGWIN_ROOT = "$env:HOMEDRIVE\cygwin"
$CYGWIN_EXE = "$env:CYGWIN_ROOT\cygwinsetup.exe"
$CYGWIN_ARGS = "-n -q -R $env:CYGWIN_ROOT -l $env:CYGWIN_ROOT -s $url -P $packages"

# install Cygwin
mkdir $env:CYGWIN_ROOT
Invoke-WebRequest -Uri "https://cygwin.com/setup-x86_64.exe" -OutFile $CYGWIN_EXE
Start-Process $CYGWIN_EXE -ArgumentList $CYGWIN_ARGS
Set-Alias -Name "cygwin" -Value "$env:CYGWIN_ROOT\Cygwin.bat"

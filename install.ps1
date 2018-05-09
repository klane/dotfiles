# add necessary buckets
scoop bucket add extras
scoop bucket add versions

# install common programs
scoop install ln
scoop install sudo
scoop install which
sudo scoop install 7zip --global
sudo scoop install git --global

# install languages
scoop install miniconda3
scoop install python27
scoop install python
scoop install r

# install developer tools
scoop install atom
scoop install cmder
scoop install gitkraken
scoop install jetbrains-toolbox
scoop install notepadplusplus
scoop install sourcetree
scoop install sqlitebrowser
scoop install sublime-text
scoop install vscode

# install other programs
scoop install cygwin
scoop install flux
scoop install msys2

# install additional cygwin programs
& "$env:SCOOP\apps\cygwin\setup-x86_64.exe" -n -q -P curl,fish,fontconfig,wget,zsh

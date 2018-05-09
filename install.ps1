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
scoop install flux
scoop install msys2

#
sudo choco install cygwin -y
sudo choco install cyg-get -y
cyg-get curl
cyg-get fontconfig
cyg-get wget
cyg-get fish
cyg-get zsh

pip install flake8
pip install pylint
pip install autopep8
pip install pipenv
pip install powerline-status

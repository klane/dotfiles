![](https://github.com/klane/dotfiles/workflows/Format/badge.svg)

# Installation

## macOS

```bash
# set DIR to desired repo location
git clone https://github.com/klane/dotfiles $DIR
cd $DIR/scripts
source install.sh
```

## Windows

### PowerShell

```powershell
$Script = Invoke-WebRequest https://raw.githubusercontent.com/klane/dotfiles/master/scripts/install.ps1
Invoke-Expression $($Script.Content) # MSYS2 Bash shell will open
```

### Bash

```bash
pacman -Syu # close MSYS2
# start MSYS2 with msys2.exe in installation directory, not 'current' junction
# follow macOS instructions above
```

## SSH

Create a new SSH key on GitHub with the contents of ~/.ssh/github.key.pub.
Execute the following command to authenticate the SSH key.

```bash
ssh -T git@github.com
```

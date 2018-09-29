# Installation

## Mac

```bash
curl https://raw.githubusercontent.com/klane/dotfiles/master/install.sh | bash
```

## Windows

### PowerShell

```powershell
$ScriptFromGithHub = Invoke-WebRequest https://raw.githubusercontent.com/klane/dotfiles/master/install.ps1
Invoke-Expression $($ScriptFromGithHub.Content) # MSYS2 Bash shell will open
```

### Bash

```bash
pacman -Syu # close MSYS2
# start MSYS2 with msys2.exe in installation directory, not 'current' junction
curl https://raw.githubusercontent.com/klane/dotfiles/master/install.sh | bash
```

## SSH

Create a new SSH key on GitHub with the contents of ~/.ssh/id_rsa.pub.
Execute the following command to authenticate the SSH key.

```bash
ssh -T -o StrictHostKeyChecking=no git@github.com
```

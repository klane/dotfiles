# Installation

## Mac

```bash
curl https://raw.githubusercontent.com/klane/dotfiles/master/install.sh | bash
```

## Windows

### PowerShell

```powershell
$ScriptFromGithHub = Invoke-WebRequest https://raw.githubusercontent.com/klane/dotfiles/master/install.ps1
Invoke-Expression $($ScriptFromGithHub.Content)
cygwin # starts Bash shell
```

### Bash

```bash
curl https://raw.githubusercontent.com/klane/dotfiles/master/install.sh | bash
```

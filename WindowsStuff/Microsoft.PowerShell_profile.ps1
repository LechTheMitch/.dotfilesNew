$PSStyle.FileInfo.Directory = "`e[33m"
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineOption -BellStyle None
Invoke-Expression (& { (zoxide init powershell | Out-String) })
oh-my-posh init pwsh | Invoke-Expression
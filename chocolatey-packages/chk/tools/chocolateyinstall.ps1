$ErrorActionPreference = 'Stop';

$chkps1 = resolve-path $PSScriptRoot\chk.ps1
. $chkps1



$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($chkLink)
$Shortcut.TargetPath = $chkahk
$Shortcut.Save()

invoke-item "$chkLink"
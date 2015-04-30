$ErrorActionPreference = 'Stop';

$packageName = 'chk'
$cinst = $env:ChocolateyInstall
$packageDir = join-path $cinst\lib\ -ChildPath $packageName

$toolsDir = join-path $packageDir -ChildPath "Tools"

$pluginsDir = join-path $toolsDir -ChildPath "Plugins"
mkdir $pluginsDir

$chkahk = join-path $toolsDir -ChildPath "chk.ahk"

$userProfile = $env:UserProfile
$startupDir = join-path "$userProfile" -ChildPath "AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

$chkLink = "$startupDir\chk.lnk";


$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($chkLink)
$Shortcut.TargetPath = $chkahk
$Shortcut.Save()

invoke-item "$chkLink"
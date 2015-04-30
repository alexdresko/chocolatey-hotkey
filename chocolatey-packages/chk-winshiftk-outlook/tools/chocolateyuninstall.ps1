$ErrorActionPreference = 'Stop';

$chkPackageName = 'chk'
$cinst = $env:ChocolateyInstall
$chkPackageDir = join-path $cinst\lib\ -ChildPath $chkPackageName

$chkToolsDir = join-path $chkPackageDir -ChildPath "Tools"

$chkPluginsDir = join-path $chkToolsDir -ChildPath "Plugins"

$chkahk = join-path $chkToolsDir -ChildPath "chk.ahk"

$userProfile = $env:UserProfile
$startupDir = join-path "$userProfile" -ChildPath "AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

$chkLink = "$startupDir\chk.lnk";


$thisPackageName = 'chk-winshiftk-outlook'
$thisPackageDir = join-path $cinst\lib\ -ChildPath $thisPackageName
$thisToolsDir = join-path $thisPackageDir -ChildPath "Tools"
$thisahk = join-path $thisToolsDir -ChildPath "$thisPackageName.ahk"
$remoteahk = join-path "$chkPluginsDir" -ChildPath "$thisPackageName.ahk"

del $remoteahk

$pluginsAhk = join-path $chkToolsDir -childPath "plugins.ahk"

del $pluginsAhk

invoke-item "$chkLink"
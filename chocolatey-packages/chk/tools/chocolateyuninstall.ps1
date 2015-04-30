﻿$ErrorActionPreference = 'Stop';

Stop-Process -ProcessName autohotkey  -force

$packageName = 'chk'
$cinst = $env:ChocolateyInstall
$packageDir = join-path $cinst\lib\ -ChildPath $packageName

$toolsDir = join-path $packageDir -ChildPath "Tools"

$pluginsDir = join-path $toolsDir -ChildPath "Plugins"

$chkahk = join-path $toolsDir -ChildPath "chk.ahk"

$userProfile = $env:UserProfile
$startupDir = join-path "$userProfile" -ChildPath "AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

$chkLink = "$startupDir\chk.lnk";


rmdir "$chkLink"

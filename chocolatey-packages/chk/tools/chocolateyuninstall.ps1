$ErrorActionPreference = 'Stop';

$chkps1 = resolve-path $PSScriptRoot\chk.ps1
. $chkps1

$uninstall = join-path $chkToolsDir -ChildPath "uninstall.ahk"

invoke-item $uninstall


rm "$chkLink"


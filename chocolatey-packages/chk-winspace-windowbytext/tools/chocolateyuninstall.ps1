$ErrorActionPreference = 'Stop';

$chkps1 = resolve-path $PSScriptRoot\..\..\chk\tools\chk.ps1
. $chkps1

ReloadChk


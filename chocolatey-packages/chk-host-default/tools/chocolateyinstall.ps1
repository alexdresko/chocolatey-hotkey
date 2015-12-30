$ErrorActionPreference = 'Stop';

$chkps1 = resolve-path (join-path $(Split-Path -parent $MyInvocation.MyCommand.Definition) -ChildPath "..\..\chk\tools\chk.ps1")

. $chkps1

InstallHost
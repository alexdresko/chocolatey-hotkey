$thisDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
cd $thisDir
$name = (get-item .).Name

choco uninstall $name --all-versions -advyf 
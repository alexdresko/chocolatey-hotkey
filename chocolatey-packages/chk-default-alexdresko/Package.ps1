$thisDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
cd $thisDir
$thisDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
cd $thisDir
cpack
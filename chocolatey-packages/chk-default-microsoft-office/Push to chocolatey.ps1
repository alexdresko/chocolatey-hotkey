$thisDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
cd $thisDir
$name = (get-item .).Name
[xml]$nuspec = Get-Content "$name.nuspec"
$version = $nuspec.DocumentElement.metadata.version
write-host "pushing $name.$version.nupkg"
choco push "$name.$version.nupkg"
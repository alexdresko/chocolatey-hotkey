$name = (get-item .).Name
$source = (get-item .).FullName
[xml]$nuspec = Get-Content "$name.nuspec"
$version = $nuspec.DocumentElement.metadata.version
write-host "pushing $name.$version.nupkg"
$thisDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
cd $thisDir
choco push "$name.$version.nupkg"
$name = (get-item .).Name
$source = (get-item .).FullName
[xml]$nuspec = Get-Content "$name.nuspec"
$version = $nuspec.DocumentElement.metadata.version
write-host "pushing $name.$version.nupkg"
choco push "$name.$version.nupkg"
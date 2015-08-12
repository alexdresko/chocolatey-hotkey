$name = (get-item .).Name
$source = (get-item .).FullName
[xml]$nuspec = Get-Content "$name.nuspec"
$version = $nuspec.DocumentElement.metadata.version
choco install $name -s $source -fyi -version $version -debug
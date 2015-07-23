$name = (get-item .).Name
$source = (get-item .).FullName
choco install $name -s $source -fyi
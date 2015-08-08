$name = (get-item .).Name

choco uninstall $name --all-versions -advyf 
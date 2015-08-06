$chkPackageName = 'chk'
$cinst = $env:ChocolateyInstall
$chkPackageDir = join-path $cinst\lib\ -ChildPath $chkPackageName
$chkToolsDir = join-path $chkPackageDir -ChildPath "Tools"
$userProfile = $env:UserProfile

$startupDir = join-path "$userProfile" -ChildPath "AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

$chkahk = join-path $chkToolsDir -ChildPath "chk.ahk"



$pluginsAhk = join-path $chkToolsDir -childPath "plugins.ahk"

function GetHostLink($name)
{
	return  $startupDir + "\chk-host-" + $name  + ".lnk";
	
}

function InstallHost($name)
{
	$hostLink = GetHostLink($name)
	$target = join-path $cinst -childpath "lib\chk-host-$name\tools\chk-host-$name.ahk"

	$WshShell = New-Object -comObject WScript.Shell
	$Shortcut = $WshShell.CreateShortcut($hostLink)

	$Shortcut.TargetPath = $target 
	$Shortcut.Save()

	invoke-item "$hostLink"
}

function UninstallHost($name)
{
	$uninstall = join-path $cinst -childpath "lib\chk-host-$name\tools\uninstall.ahk"

	invoke-item $uninstall
	$hostLink = GetHostLink($name)
	rm "$hostLink"
}

function ReloadHost($name)
{
	$hostLink = GetHostLink($name)

	if (test-path $pluginsAhk)
	{
		del $pluginsAhk
	}

	invoke-item "$hostLink"
}
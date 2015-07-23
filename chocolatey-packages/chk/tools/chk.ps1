$chkPackageName = 'chk'
$cinst = $env:ChocolateyInstall
$chkPackageDir = join-path $cinst\lib\ -ChildPath $chkPackageName

$chkToolsDir = join-path $chkPackageDir -ChildPath "Tools"

$chkPluginsDir = join-path $chkToolsDir -ChildPath "Plugins"

$chkahk = join-path $chkToolsDir -ChildPath "chk.ahk"

$userProfile = $env:UserProfile
$startupDir = join-path "$userProfile" -ChildPath "AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

$chkLink = "$startupDir\chk.lnk";

$pluginsAhk = join-path $chkToolsDir -childPath "plugins.ahk"

function ReloadChk
{
	if (test-path $pluginsAhk)
	{
		del $pluginsAhk
	}

	invoke-item "$chkLink"
}
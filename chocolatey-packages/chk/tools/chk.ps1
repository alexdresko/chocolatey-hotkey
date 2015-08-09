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

function InstallHost()
{
	$path = $script:MyInvocation.MyCommand.Path
	$name =$path -match "chk-host-(.*?)\\" | foreach { $matches[1] } | select -first 1

	$hostLink = GetHostLink($name)

	$target = join-path $cinst -childpath "lib\chk-host-$name\tools\chk-host-$name.ahk"

	$WshShell = New-Object -comObject WScript.Shell
	$Shortcut = $WshShell.CreateShortcut($hostLink)

	$Shortcut.TargetPath = $target 
	$Shortcut.Save()

	Start-Process "$hostLink"
}

function UninstallHost()
{
	$path = $script:MyInvocation.MyCommand.Path
	$name =$path -match "chk-host-(.*?)\\" | foreach { $matches[1] } | select -first 1

	$hostLink = GetHostLink($name)

	$uninstall = join-path $cinst -childpath "lib\chk-host-$name\tools\uninstall.ahk"
	"Invoking $uninstall"
	Start-Process $uninstall
	$hostLink = GetHostLink($name)
	rm "$hostLink"
}

function ReloadHost()
{
	$file  = $script:MyInvocation.MyCommand.Path

	$hostName = (get-item $file).Directory.Parent.Name -match "chk-(.*?)-" | foreach { $Matches[1] } | select -First 1
    	$plugins = Join-Path $env:ChocolateyInstall -ChildPath "lib\chk-host-default\tools\plugins.ahk"
    	if (test-path $plugins)
    	{
    		remove-item $plugins -Force
    	}
	$hostLink = GetHostLink($hostName)

	Start-Process "$hostLink"
	
}
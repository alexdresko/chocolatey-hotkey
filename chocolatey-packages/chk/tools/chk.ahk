#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\ ; so the paths can be relative in the plugins.ahk
	#include *i %A_ScriptDir%\plugins.ahk ; *i so the file can be non-existant

	FileRead , plugins_old , %A_ScriptDir%\plugins.ahk ; for comparison later on

	FileDelete %A_ScriptDir%\plugins.ahk ; make room to populate the file

	pluginIndex := -10
	loop 20
	{
		item := pluginIndex + A_Index
		loop, %A_ScriptDir%\..\..\chk-plugin-%item%-*.ahk, 0, 1
		{
			FileAppend, `n#include %A_LoopFileFullPath%, %A_ScriptDir%\plugins.ahk
		}
	}


	loop, %A_ScriptDir%\..\..\chk-plugin.ahk, 0, 1
	{
		FileAppend, `n#include %A_LoopFileFullPath%, %A_ScriptDir%\plugins.ahk
	}

	FileRead , plugins_new , %A_ScriptDir%\plugins.ahk
	if plugins_old <> %plugins_new% ; if they're not the same, a file was added or removed, so do a reload of the script 
		reload


::kerpow::Chocolatey Hotkey

AddFile(mask)
{
	

}
;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\plugins\ ; so the paths can be relative in the plugins.ahk
	#include *i %A_ScriptDir%\plugins.ahk ; *i so the file can be non-existant

	FileRead , plugins_old , %A_ScriptDir%\plugins.ahk ; for comparison later on

	FileDelete %A_ScriptDir%\plugins.ahk ; make room to populate the file
	loop, %A_ScriptDir%\plugins\*.ahk
		FileAppend, `n#include %A_LoopFileName%, %A_ScriptDir%\plugins.ahk

	FileRead , plugins_new , %A_ScriptDir%\plugins.ahk
	if plugins_old <> %plugins_new% ; if they're not the same, a file was added or removed, so do a reload of the script 
		reload


::kerpow::Chocolatey Hotkey
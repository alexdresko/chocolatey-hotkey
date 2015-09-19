#+s::
  DoVisualStudio()
return

#+^i::
  DoInternetExplorer()
return

#+c::
  DoSublime()
return

::jad::Alex Dresko


::dt::
FormatTime, CurrentDateTime,, M/d/yyyy h:mm:ss tt
RR = %CurrentDateTime%: %A_Space%
SendInput %RR%  %A_Space%
return

::rr::
SendInput %RR%
return


::dftba::
SendInput don't forget to be awesome{!}
return

::dtad::
FormatTime, CurrentDateTime,, M/d/yyyy h:mm:ss tt
RR = %CurrentDateTime% by AD: %A_Space%
SendInput %RR%  %A_Space%
return

::dadtad::
FormatTime, CurrentDateTime,, M/d/yyyy h:mm:ss tt
RR = DONE AT %CurrentDateTime% by AD > %A_Space%
SendInput %RR%  %A_Space%
return

::taodtad::
FormatTime, CurrentDateTime,, M/d/yyyy h:mm:ss tt
RR = TESTABLE AS OF %CurrentDateTime% by AD > %A_Space%
SendInput %RR% %A_Space%
return

::dbdtad::
FormatTime, CurrentDateTime,, M/d/yyyy h:mm:ss tt
RR = DONE BEFORE %CurrentDateTime% by AD >%A_Space%
SendInput %RR% %A_Space%
return

::sadtad::
FormatTime, CurrentDateTime,, M/d/yyyy h:mm:ss tt
RR = < STARTED AT %CurrentDateTime% by AD > %A_Space%
SendInput %RR% %A_Space%
return


::aodtad::
FormatTime, CurrentDateTime,, M/d/yyyy h:mm:ss tt
RR = as of %CurrentDateTime% by AD.%A_Space%
SendInput %RR% %A_Space%
return

::aodt::
FormatTime, CurrentDateTime,, M/d/yyyy h:mm:ss tt
RR = as of %CurrentDateTime%. %A_Space%
SendInput %RR% %A_Space%
return

::fsdtad::
FormatTime, CurrentDateTime,, yyyy-MM-dd HH-mm-ss
RR = %CurrentDateTime% by Alex Dresko
SendInput %RR%
return

::@cc::adresko@cchpsc.org
::@hotmail::alexdresko@hotmail.com
::@gmail::alexdresko@gmail.com
::@home::me@alexdresko.com
::@tibby::me@tibreadresko.com
::ccorg::consumerschoicesc.org
::sddocs::C:\Users\adresko\SkyDrive\Documents

#F11::
SetTitleMatchMode, 2
IfWinExist global.ahk
{
	WinActivate

}
else
{
	Run %pathToTextEditor%, "%a_scRiPtfuLlpath%"
}
return

#F12::
Run %a_scRiPtfuLlpath%
return


/*
Activates the current objective.
*/
#^c::

SetTitleMatchMode, 2
FileReadLine, objective, objective.txt, 1
IfWinExist %objective%
{
    WinActivate
}
return

/*
SETS the current objective.
*/
#!c::
FileDelete, objective.txt
WinGetActiveTitle, Title
MsgBox, The active window is "%Title%".
FileAppend, %Title%, objective.txt

return


#+^k::
SetTitleMatchMode, 2
IfWinExist Remote Desktop
{
    WinActivate
}
else
{
    Run mstsc
    WinActivate
}
return

#w::
SetTitleMatchMode, 2
IfWinExist Windows Media Player
{
    WinActivate
}
else
{
    Run wmplayer
    WinActivate
}
return

#+r::
SetTitleMatchMode, 2
IfWinExist Reminder
{
    WinActivate
}
else
{
    Send, {LWINDOWN}k{LWINUP}
    WinWait, - Outlook,
    IfWinNotActive, - Outlook, , WinActivate,- Outlook,
    WinWaitActive, - Outlook,
    SendPlay, {ALTDOWN}v{ALTUP}m

    IfWinExist Reminders
    {
        WinActivate
    }
}
return

#+q::
SetTitleMatchMode, 2
IfWinExist LINQPad
{
	WinActivate

}
else
{
	Run C:\Program Files (x86)\LINQPad4\LINQPad.exe
}
return

#+o::

InputBox, UserInput, OneNote Faves, 1 = Groceries. 2 = Alex. 3 = Together. 4 = CSI Projects. 5 = Organizational, , 640, 480
if NOT ErrorLevel
{
  IfEqual UserInput, 1
  {
    Run %A_ScriptDir%\..\OneNoteFaves\Groceries.url
  }

  IfEqual UserInput, 2
  {
    Run %A_ScriptDir%\..\OneNoteFaves\Alex.url
  }


  IfEqual UserInput, 3
  {
    Run %A_ScriptDir%\..\OneNoteFaves\Together.url
  }


  IfEqual UserInput, 4
  {
    Run %A_ScriptDir%\..\OneNoteFaves\CSI Projects.url
  }

  IfEqual UserInput, 5
  {
    Run %A_ScriptDir%\..\OneNoteFaves\Organizational.url
  }


}

return

/*
Paste figure and adds caption in outlook
*/
#+^e::
SetTitleMatchMode, 2
WinGetActiveTitle, Title
Send, {CTRLDOWN}v{CTRLUP}
Sleep 1000,
Send, {ALT}{ALT}{SHIFTDOWN}{LEFT}{SHIFTUP}{AppsKey}N
WinWait, Caption,
IfWinNotActive, Caption, , WinActivate, Caption,
WinWaitActive, Caption,
Sleep 100
Send {ENTER}
Sleep 100
Send, {SHIFTDOWN}{HOME}{SHIFTUP}
Sleep 500
WinWait, %Title%,
IfWinNotActive, %Title%, , WinActivate, %Title%,
WinWaitActive, %Title%,
clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait  ; Wait for the clipboard to contain text.
Send ^h
Sleep 500
Send jjj
Send {ENTER}{ENTER}{ESC}
Sleep 500
Send #+e
return

/*
Insert the copied reference  in outlook
*/
#+e::
spaceIndex := InStr( clipboard, " ")
type := SubStr(clipboard, 1, spaceIndex)

Send, {ALT}SRF
WinWait, Cross-reference,
IfWinNotActive, Cross-reference, , WinActivate, Cross-reference,
WinWaitActive, Cross-reference,
Loop, parse, type
{
  Send, %A_LoopField%
}
Send, {TAB}!w
Sleep 500


Loop, parse, clipboard
{
  Sendraw, %A_LoopField%
}
Send {ALTDOWN}I{ALTUP}{ESC}
return


/*
Paste figure and adds caption
*/
#+^f::
SetTitleMatchMode, 2
WinGetActiveTitle, Title
Send, {CTRLDOWN}v{CTRLUP}
Sleep 1000,
Send, {ALT}{ALT}{SHIFTDOWN}{LEFT}{SHIFTUP}{ALT}SP
WinWait, Caption,
IfWinNotActive, Caption, , WinActivate, Caption,
WinWaitActive, Caption,
Sleep 100
Send {ENTER}
Sleep 100
Send, {SHIFTDOWN}{HOME}{SHIFTUP}
Sleep 500
WinWait, %Title%,
IfWinNotActive, %Title%, , WinActivate, %Title%,
WinWaitActive, %Title%,
clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait  ; Wait for the clipboard to contain text.
Send ^f
Sleep 500
Send jjj
Send {ENTER}{ENTER}{ESC}
Sleep 500
Send #+f
return

/*
Insert the copied reference
*/
#+f::
spaceIndex := InStr( clipboard, " ")
type := SubStr(clipboard, 1, spaceIndex)

Send, {ALT}SRF
WinWait, Cross-reference,
IfWinNotActive, Cross-reference, , WinActivate, Cross-reference,
WinWaitActive, Cross-reference,
Loop, parse, type
{
  Send, %A_LoopField%
}
Send, {TAB}!w
Sleep 500


Loop, parse, clipboard
{
  Sendraw, %A_LoopField%
}
Send {ALTDOWN}I{ALTUP}{ESC}
return


#+h::
SetTitleMatchMode, 2
IfWinExist HexChat
{
    WinActivate
}
else
{
  Run C:\Program Files\HexChat\hexchat.exe
  WinActivate
}
return


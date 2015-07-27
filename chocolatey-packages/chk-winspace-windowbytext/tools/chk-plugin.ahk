#Space::
SetTitleMatchMode, Regex
InputBox, UserInput, Title?
IfWinExist i)%UserInput%
{
	WinActivate
}
else
{
	MsgBox Could not find "%UserInput%"
}
return
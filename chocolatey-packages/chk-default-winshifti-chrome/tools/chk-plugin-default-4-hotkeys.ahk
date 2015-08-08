#+i::
SetTitleMatchMode, 2
IfWinExist Chrome
{
    WinActivate
}
else
{
    Run Chrome
    WinActivate
}
return
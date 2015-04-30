#+k::
SetTitleMatchMode, 2


 IfWinExist - Outlook
 {
     WinActivate
 }
 else
 {
     Run Outlook
     WinActivate
 }
return
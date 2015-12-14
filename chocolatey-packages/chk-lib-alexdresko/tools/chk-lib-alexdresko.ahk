DoVisualStudio()
{
  SetTitleMatchMode, 2
  IfWinExist Microsoft Visual Studio ahk_exe devenv.exe
  {
      WinActivate
  }
  else
  {
      Run "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"
      WinActivate
  }
}

DoInternetExplorer()
{
  SetTitleMatchMode, 2
  IfWinExist Internet Explorer
  {
      WinActivate
  }
  else
  {
      Run iexplore
      WinActivate
  }
}

DoSublime()
{
  SetTitleMatchMode, 2
  IfWinExist Sublime Text
    WinActivate
  else
    Run c:\programdata\Microsoft\Windows\Start Menu\Programs\Sublime Text 3.lnk
}

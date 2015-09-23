DoOutlook()
{
	SetTitleMatchMode, 2

	IfWinExist  Outlook ahk_class rctrl_renwnd32
	{
		WinActivate	
	}
	else
	{
		Run Outlook
		WinActivate
	}
}
DetectHiddenWindows On  ; Allows a script's hidden main window to be detected.
SetTitleMatchMode 2  ; Avoids the need to specify the full path of the file below.

SplitPath % a_scriptdir, d1, d2


SplitPath % d2, d3, d4



WinClose %d3%
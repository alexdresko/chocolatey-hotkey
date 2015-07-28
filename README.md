# chocolatey-hotkey
A modular system for installing AutoHotKey plugins with Chocolatey.

For more information, please see http://www.alexdresko.com/2015/07/23/chocolatey-hotkey/

Current plans
-------
7/28/2015 1:03:49 PM by AD:   I'm currently working through the list below in preparation for a video I'm doing to explain CHK in more detail.  I'm only sharing this in case anyone wants to see what's happening behind the scenes. 

**dev prep**

* Verify published chk can have dependency
* Verify published chk can be easily upgraded. 
* Support running scripts outside of the plugin system. Some plugins just need to be indepdendent. I'd create this as a different chk type.. "self-contained"
* Support the organizational structure presented at http://www.autohotkey.com/board/topic/93889-hotkey-help-display-active-ahk-hotkeys-and-hotstrings/page-6?hl=%2Borganize+%2Bmain#entry623474 
* Support library scripts that don't get auto-executed.... something that needs to be manually included. I guess it already does this. 
* self-contained scripts might want to create a shortcut on the desktop

**video prep**
1. create VM
2. disable security for browser

**demo**

1. Install chocolatey
	https://chocolatey.org/
2. install shortcut
	choco install chk-dt-fordatetime -version 1.0.0 -y

*pause*

1. install git
2. clone repo
	1. mkdir c:\code\git
	2. cd c:\code\git
	3. git clone https://github.com/alexdresko/chocolatey-hotkey.git
	4. cd c:\code\git\chocolatey-hotkey\chocolatey-packages

*action*

3. demo new chk plugin to be published. 
4. choco install nodejs -y
5. npm install -g yo
6. npm install -g generator-chocolateyhotkey
7. yo chocolateyhotkey
8. complete the wizard
9. paste in script
10. powershell
11. package
12. test install
13. test uninstall
14. push
15. choco apiKey -k [INSERT] -source https://chocolatey.org/
16. push

demo the creation and publishing of anoather plugin now that everything is installed to show how quickly it can be done once you have everything set up. This demo will be played after the initial install demo, but before the detailed creation demo. 

**after**

1. push to github



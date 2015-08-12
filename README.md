# chocolatey-hotkey
A modular system for installing AutoHotKey plugins with Chocolatey.

For more information, please see http://www.alexdresko.com/2015/07/23/chocolatey-hotkey/



Enter as Issues
-------
* Update the original blog post to use new package names. 
*  I want to support a better prioritization technique.. for now, what I have I think will work. 
* Uninstalling a host doesn't always shut down the host and delete the host file. I have ideas for making this work.  For example, if there are no more plugins running in a host when the plugins are loaded, the host can exit itself.  That might enable the host to be uninstalled properly. 
* Would like to create a hot key .. something like WIN+SHIFT+H that tells each host to show which plugins are installed. I envision some kind of popup window to helps users see what is running in each host. 
* Later, I want to support a better prioritization technique.. for now, what I have I think will work. 
* self-contained scripts might want to create a shortcut on the desktop. This is technically something that chocolatey supports, but I haven't played with it. 
* support user settings? Maybe CHK already does this by virtue of the various AHK stages available in each plugin. CHK actually supports more than what you can see just by looking at those scripts. 
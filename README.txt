Welcome To the Autoclicker Utility

Description:
A Powershell Utility to automatically log where, when and what button on the mouse you click, 
its intention is to be used to simplyfiy automation of thirdparty software that do not provide 
an API such as some Mcafee apps

How to use:

You need to put the ClickLogger.ps1 and Clicker.ps1 scripts in the same directory 

You first need to run the ClickLogger.ps1 script in order to create a log of all your clicks.
Enter the name of the action you are doing when prompted by the script.
While running the script, be aware that you have to hold the left or right mouse button down 
a little while before it records the click. This is due to the while loop beeing somewhat slow
atleast on my computer, unsure why this is. 

After running the Clicklogger.ps1 script it creates a folder calles functionclickerfiles in the 
local directory its ran from, you can then run the Clicker.ps1 script, when prompted for a name 
enter the name of the file you entered earlier. and the autoclicker should do its job.

in order to use this in a proper script, you just need to copy the foreach loop in the clicker 
scrtipt, you could make a function with this foreach loop and suply the filenames for the clicker
when applicable, hope that made sence :D Best of luck if anyone tries to use it
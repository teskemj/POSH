# Presetup

1. Connect and power on
1. Select Region = US
1. Keyboard setup = US
1. Skip keyboard layout
1. Accept License Agreement
1. Set up for personal use
    1. Lower left corner, select Offline Account
    1. Choose no when asked to sign in with MS account.
    1. Name = ksiadmin
    1. Password = ksiP@ssword
    1. Security 1=First pets name=ksi
    1. Security 2=Name of city you were born=ksi
    1. Security 3=Childhood nickname=ksi
1. Cortana=No
1. Turn off all privacy controls
1. Click next under register and protect
1. Uncheck communication options on next register and protect screen

## After presetup

1. Skip HP Jumpstart
1. Close HP SureClick
1. Browse to https://github.com/teskemj/posh
1. Select deployment folder
1. Click Remove-HPGarbage.ps1
1. Highlight all and copy.
1. Type ISE in the cortana search bar
1. Right click on PowerShell ISE and run as Administrator
1. Click the down caret at the top right of blue screen next to script. This will display the script page.
1. Right click first line and paste what you copied.
1. Save this file to your desktop as we will need it after reboot. File name is meaningless. Untitled1. is awesome.
1. Click on the line "uninstall-package -name "HP Device Access Manager" -force"
1. Press F8 with it highlighted. This runs that single line of the script.
1. Highlight the lines from # Retrieve all HP Packages to the last line with a } #End FOREACH
1. Press F8 to run all highlighted code. Don't worry, you won't break anything.
1. Scroll the script to the # Housekeeping sections.
1. Highlight the lines under # Housekeeping but above return to here after reboot.
1. It will reboot and run updates. This may take a little time, around 4 minutes
1. Log in
    1. Username: ksiadmin
    1. Password: ************
1. Open PowerShell ISE as administrator as instructed above
1. Find the section ## Start here after reboot
1. Place the cursor on the line as instructed. We are only running one line. This installs an opensource package to help with the installation of the remaining 
1. Browse to https://gist.github.com/teskemj
1. Select the bottom gist. deployhp.ps1
1. You should see a button on the right at the top of the code box labeled RAW. Click it.
1. Copy the URL (web address bar) and return to the PowerShell ISE screen.
1. Scroll to the last line of code starting with 'install-boxstarterpackage -packagename.
1. Replace the URL after Package name with the URL you just copied.
1. Run that line of code. This will being the installation process of remaining software.
1. Open PowerShell ISE as administrator. If not already there, open the script again and re-run the process to remove the HP software to remove residuals.
1. It may reboot, if it does, log in and verify the following:
    1. Is the people bar in the taskbar by the task menu
    1. Is google chrome on desktop
    1. Right click on Window button and select PowerShell (Administrative)
    1. At the prompt, type hostname and press enter. Is the computername correct.
1. Remember to document the computername to remember the next incremental number.
1. Rebox PC and stage next PC.


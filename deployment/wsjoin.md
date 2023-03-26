# Workstation Domain Join

1. Log in with
    u: LPIADMIN
    p: LPIP@ssw0rd54562 or LPIP@ssw0rd
1. Right click on the Window icon and select Windows PowerShell (admin)
1. Type the following:

```powershell
   add-computer -domainname ad -domaincredential ad\administrator -restart
```

1. It will present a login box. Type the password LPIP@ssw0rd54562!
1. It should automatically restart.

## Install Sage
"""
1. Log in with the "D\Administrator "ccount."
1. Insert USB with "KSetup on it.""
1. Run the Autorun "nd select the first"option."
1. Server is app1
1. Port is 10000
1. Path to sage is \\app1\apps\sage\sage2018\mas90
1. Click Install
1. After it installs, run MAS to run updates.
1. Log in with user account ie. 
    u: kris
    p: LPIP@ssw0rd54562
1. Search for Sage in the programs menu by typing Sage. Right click and add to task bar. It may be hidden in the More option.

## If the Domain Join option doesn't work (it should), or you think this is easier 😉

1. Right click on the Window icon, select System. Select **System Info** in the upper right corner.
1. Click Advanced System Settings
1. Click the Computer Name tab.
1. Click the change button
1. Select the domain option and type AD and click OK
1. Submit the domain admin credentials. Click Ok...reboot. Go to Install Sage above.

## Open Office products

1. Open any office product. It will want the username and password.
1. It has a default to use on all applications on this device. Select Yes.
1. You can right click on the MS apps and pin to taskbar...that option is hidden on some in the ...More submenu.

### Printers

1. Might need to re-add if it wasn't added as a local printer. I can do this when I am up there with the scanners. Or walk you through.
# Desktop onsite deployment steps

1. Join domain
   - Click Start button and type PowerShell. Do not click to launch. 
   - Right click and choose Run As Administrator
   - Type:

        ```powershell 
        add-computer -domainname internal.kenssports.local -domaincredential internal/administrator
        ```

   - It will prompt you for the password. Type in the password
   - Reboot
   - Log in as user
      - Username
      - kenssportspassword (typically, if not, ask for their password)
   - Start Windows updates (do this right away as it will take some time)
   
2. Install Lightspeed client software
   - Launch file explorer and type `\\fs1\apps\` in the address bar and hit enter.
   - Locate Lightspeed Client Installer 4.1.2.30.exe. Double click to begin the installation.
   - 
[Github MD Formatting Basics](https://help.github.com/en/articles/basic-writing-and-formatting-syntax)

[Advanced MD Formatting on GitHub](https://help.github.com/en/articles/working-with-advanced-formatting)

[Mastering Markdown on GitHub](https://guides.github.com/features/mastering-markdown/)

[This is a test](https://docs.microsoft.com/en-us/azure/)

>ksi-w732
ksi-w733
ksi-w704
ksi-w726
ksi-w707
ksi-w734
ksi-w716->craigg ls-36


### Reset Machines Computer Password on domain

```powershell
Reset-ComputerMachinePassword -Credential (Get-Credential)
```

local admin password is ksi P@ssword

# These commands will provision a web server "manually". Another method to perform this would be to use DSC.
# Install IIS Management console via Windows Features on the local remote. Required for the following download to install
# Download IIS manager tools for your remote workstation. Acknowledgement to Pluralsight and Michael Bender

start iexplore.exe http://www.iis.net/downloads/microsoft/iis-manger #save to local remote station and install
$computername = 'mt-web1' #This is the name of YOUR webserver. Must have single quotes.

# Install Role on remote web server
invoke-command -ComputerName $computername {
    Install-WindowsFeature web-mgmt-service,web-server,web-asp-net,web-basic-auth,web-ipsecurity
}

# Allow remote management for IIS on remote server
invoke-command -ComputerName $computername {
    Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\webmanagement\server -Name EnableRemoteManagement -value 1
}
# settign service startup time and restarting service
Invoke-Command -ComputerName $computername {
    set-service wmsvc -StartupType Automatic
}

Invoke-Command -ComputerName $computername {
    restart-service wmsvc
}

#verification of role
Enter-PSSession -ComputerName $computername
    Import-Module WebAdministration
    get-website -name *
    Get-ChildItem -Path iis:\sites
    Exit-PSSession

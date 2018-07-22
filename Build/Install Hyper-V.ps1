#list all modules on the machine. We can see whether or not Hyper-V is installed
get-module -ListAvailable

# Verify that Hyper-V is not installed.
Get-WindowsFeature -Name Hyper-V | 
    Select-Object -Property Name, Installed

# Install Hyper -V
Add-WindowsFeature -Name Hyper-V -IncludeAllSubFeature -IncludeManagementTools -Restart

# Install Hyper-V using Splating.

$Splat = @{
    Name = "Hyper-V"
    IncludeAllSubFeature = $True
    IncludeManagementTools = $True
    Restart = $True
}

Add-WindowsFeature @Splat
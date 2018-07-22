# Install Active Directory Domain Services
$Hash = @{
    Name = "AD-Domain-Services"
    IncludeManagementTools = $True
    Restart = $True
    Verbose = $True
}
    
Install-WindowsFeature @Hash


# Create the first Domain Controller in our new domain.

Import-Module ADDSDeployment

$ADHash = @{
    CreateDnsDelegation = $false
    DatabasePath = "C:\Windows\NTDS" 
    DomainMode = "Win2012R2" 
    DomainName = "PowerIT.com" 
    DomainNetbiosName = "POWERIT" 
    ForestMode = "Win2012R2" 
    InstallDns = $true 
    LogPath = "C:\Windows\NTDS" 
    NoRebootOnCompletion = $false 
    SysvolPath = "C:\Windows\SYSVOL" 
    Force = $true
    }

Install-ADDSForest @ADHash

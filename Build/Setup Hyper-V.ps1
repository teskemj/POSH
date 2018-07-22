#region Setup Virtual Switches
New-VMSwitch -Name PSTest -SwitchType Private -Notes "Switch for the Sandbox"

# Get a list of all NICs that have a Gateway address.
Get-WmiObject win32_networkAdapterConfiguration |
    Where defaultipgateway -ne $null |
    Select-Object -Property Description |
    Out-GridView -PassThru |
    ForEach-Object -Process {
        $Splat = @{
            NetAdapterInterfaceDescription = $_.Description
            Name = "PSExternal"
            AllowManagementOS = $True
            Notes = "External Switch for the Sandbox"
            Verbose = $True
        }
        New-VMSwitch @Splat  
}

#endregion

#region Create Virtual Machines

# Get the path to the Windows Server 2012 R2 ISO file.
$ISOPath = "c:\iso\en_windows_server_2012_r2_x64_dvd_2707946.iso"
$VHDPath = "c:\VM"

#get private switch
$pSwitch = Get-VMSwitch #| where {$_.switchtype -eq 'Private'}

 # Create the VM.
 $Names = "DC", "SVR1"
 ForEach ($Name in $Names)
 {
   $VMHash = @{BootDevice = "CD"
               MemoryStartupBytes = 512MB
               Name = $Name
               SwitchName = $pSwitch.name
               NewVHDPath = "$($VHDPath)\$($Name).vhdx";
               NewVHDSizeBytes = 10GB
               Verbose = $True
               }

   New-VM @VMHash 


}

# Configure the DVD drive to point to the ISO file.
 Set-VMDvdDrive -VMName DC -Path $ISOPath -Verbose
  Set-VMDvdDrive -VMName SVR1 -Path $ISOPath -Verbose

# You can adjust the MaximumBytes and MinimumBytes
# to better fit your available RAM.  The settings below
# are for a system with 4 GB of RAM.
$VMMemoryHash = @{
    DynamicMemoryEnabled = $True
    MaximumBytes = 4096MB
    MinimumBytes = 512MB
}
Get-VM -Name DC, SVR1 |
    Set-VMMemory @VMMemoryHash

# If the external NIC was created, run this code.
Get-VM DC, SVR1 | Add-VMNetworkAdapter –Name extNET -Verbose
Get-VMSwitch -Name extNET |
Connect-VMNetworkAdapter -VMName DC, SVR1 -Name extNET -Verbose
#endregion
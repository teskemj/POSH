. "C:\Program Files (x86)\VMware\Infrastructure\vSphere PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1"
cd\
Connect-VIServer https://cloud.bit.nwtc.edu
Connect-VIServer cloud.bit.nwtc.edu
ls
Get-PSProvider
get-vm
get-vm eh*
gcm *-vm
get-vm eh* | stop-vm
get-vm EH-2008R2-* | remove-vm
Get-PSProvider
sl vmstores
vmstores:
sl vmstore
Get-PSProvider
sl Env:
cls
Get-PSProvider
sl vmstores:
ls
sl vmstore
sl vmstore:
cls
ls
cd COB
ls
cd .\Tintri-Students
ls
cd ..
ls
cd Tintri
ls
cd Students
ls
cd MGT--3
dir
ls *--*
cd ..
ls *--*
ls *--* | remove-item
ls
cd ..
ls
cd Instructors
ls
ls EH-2008R2-*
ls EH-2008R2-* -Recurse | remove-item -force
ls EH-2008R2-*
ls
cd .\EH-2008R2-2
dir
ls EH-2008R2-* | remove-item -force
ls EH-2008R2-*
ls
cd ..
ls
ls EH-2008R2-*
ls EH-2008R2-* | remove-item -force
ls EH-2008R2-*
ls
cd .\Teske
ls
cd ..
cd Teske_Michael
cd ..
ls
cd ..
ls
gci Teske_Michael -Recurse
get-vm eh-kali-2
get-vm eh-kali-2 | select all
get-vm eh-kali-2 | select *
gcm *port*
gcm -Verb get *port*
gcm -Verb get *portgroup*
gcm Get-VirtualPortGroup
get-virtualportgroup
get-vm eh-kali-2 | Get-NetAdapter
get-vm eh-kali-2 | Get-NetworkAdapter
get-vm eh*-2
get-vm eh*-2 | Get-NetworkAdapter
get-vm eh*-2 | Get-NetworkAdapter {where $_.name -like "Network adapter 1"}
get-vm eh*-2 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"}
get-vm eh*-2 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} | set-networkadapter -NetworkName PPG-624
get-vm eh*-3 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} | set-networkadapter -NetworkName PPG-623
get-vm eh*-2 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} | set-networkadapter -NetworkName PPG-622
get-vm eh*-2 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} | set-networkadapter -NetworkName PPG-624
get-vm eh*-4 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} | set-networkadapter -NetworkName PPG-622
get-vm eh*-5 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} | set-networkadapter -NetworkName PPG-621
get-vm eh*-6 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} | set-networkadapter -NetworkName PPG-620
get-vm eh*-7 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} | set-networkadapter -NetworkName PPG-619
get-vm eh*-8 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} | set-networkadapter -NetworkName PPG-618
get-vm eh*-9 | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} | set-networkadapter -NetworkName PPG-617
get-vm eh-2012* | Get-NetworkAdapter | where {$_.name -like "Network adapter 1"} 
get-vm eh-2012* | Get-NetworkAdapter | where {$_.name -like "Network adapter 2"} 
get-vm eh-2012* | Get-NetworkAdapter | where {$_.name -like "Network adapter 2"}  | Set-NetworkAdapter -NetworkName D_Student_Servers_VLAN
ls
cd .\Tintri-Instructors
dir
gci -Name Teske_Michael -Recurse
gci Teske_Michael -Recurse
h

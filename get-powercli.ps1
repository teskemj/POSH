. "C:\Program Files (x86)\VMware\Infrastructure\PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1" $true
get-vm sv16-core-6
Connect-VIServer cloud.bit.nwtc.edu
get-vm sv16-core-6
get-vm SV16-Core-6
get-vm s*
get-vm s2012*
(get-vm s2012*).count
(get-vm s2012*).count
get-virtualswitch
get-virtualportgroup
Get-VirtualPortGroup | where {$_name -like "Internet-26"}
Get-VirtualPortGroup | where {$_.name -like "Internet-26"}
$portgroup = Get-VirtualPortGroup | where {$_.name -like "Internet-26"}
get-vm s2012* | Set-VirtualPortGroup -Name $portgroup
$portgroup
get-vm s2012* | Set-VirtualPortGroup -Name Internet-26
get-vm s2012* | Set-NetworkAdapter -NetworkName $portgroup
get-vm s2012* | Set-NetworkAdapter -NetworkName Internet-26
get-vm s2012* | get-networkadapter | Set-NetworkAdapter -NetworkName Internet-26
get-vm s2016-c* |Get-NetworkAdapter | select networkname
get-vm s2016-c* |Get-NetworkAdapter
get-vm s2106-c* |Get-NetworkAdapter
get-vm s2106-c*
get-vm s2106-c* |Get-NetworkAdapter | select name
gcm -noun vm
get-vm s2106-c*
get-vm s2106-c* | set-vm -Name S2016-Core-13
get-vm s2016-core-13 | get-networkadapter | Set-NetworkAdapter -NetworkName Internet-26
get-vm s2016-core-* | get-networkadapter | Set-NetworkAdapter -NetworkName Internet-26
get-vm s201* | get-networkadapter | Select name
get-vm s201* | get-networkadapter | Select NetworkName
cd .\Users\11568034\posh\

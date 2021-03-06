. "C:\Program Files (x86)\VMware\Infrastructure\vSphere PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1"
h
cd\
get-vm | get-networkadapter | where {$_.networkname -like "ppg-625"}
Connect-VIServer cloud.bit.nwtc.edu
get-vm | get-networkadapter | where {$_.networkname -like "ppg-625"}
get-vm eh-kali-8 | select *
get-vm s2012r2-2* | new-networkadapter -StartConnected
get-vm s2012r2-2* | new-networkadapter -NetworkName ppg-615 -StartConnected
get-vm *-13
get-vm s*-13
get-vm s*-13 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName PPG-616
get-vm m*-13
get-vm m*-13 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName PPG-616
get-vm m*-13 | start-vm
get-vm s*-13 | start-vm
get-vm psclient*
get-vm psclient* | get-networkadapter | set-networkadapter -NetworkName "Internet-25" -Verbose

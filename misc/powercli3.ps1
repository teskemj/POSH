. "C:\Program Files (x86)\VMware\Infrastructure\vSphere PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1"
connect-viserver
get-vm eh*-1
get-vm eh*-1 | Get-NetworkAdapter
get-vm eh*-1 | Get-NetworkAdapter | Set-NetworkAdapter "PPG-615" -StartConnected -Verbose
get-vm eh*-1 | Get-NetworkAdapter | Set-NetworkAdapter "PPG-615" -StartConnected $true -Verbose
get-vm eh*-1 | Get-NetworkAdapter | Set-NetworkAdapter "PPG-615" -StartConnected true -Verbose
get-vm eh*-1 | Get-NetworkAdapter | Set-NetworkAdapter "PPG-615" -Verbose
get-vm eh*-1 | Get-NetworkAdapter | Set-NetworkAdapter PPG-615 -StartConnected -Verbose
get-vm eh*-1 | Get-NetworkAdapter | Set-NetworkAdapter PPG-615 -Verbose
get-vm eh*-1 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName PPG-615 -Verbose
get-vm eh-*
get-vm eh-* | where {$_.powerstate -like 'poweredoff'}
get-vm eh-* | where {$_.powerstate -like 'poweredoff'} | start-vm
get-vm eh*-4 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName PPG-614 -Verbose
get-vm eh*-4 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName PPG-622 -Verbose
get-vm eh*-4 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName PPG-614 -Verbose
get-vm eh*-2 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName PPG-613 -Verbose
get-vm eh*-5 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName PPG-612 -Verbose
get-vm eh*-5 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName PPG-621 -Verbose
get-vm eh*-5 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName PPG-612 -Verbose
